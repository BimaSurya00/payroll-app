import 'dart:async';
import 'dart:convert';
import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:payroll_app/core/config/app_config.dart';
import 'package:payroll_app/core/errors/exceptions.dart';
import 'package:payroll_app/features/auth/data/datasources/auth_local_data_source.dart';

enum Method { GET, POST, PUT, DELETE, PATCH }

class ApiHelper {
  static final Dio _dio = Dio();
  static late AuthLocalDataSource _authLocalDataSource;

  // Concurrent refresh handling
  static bool _isRefreshing = false;
  static Completer<String?>? _refreshCompleter;

  // ✅ Callback untuk auto-logout ketika refresh token gagal
  static void Function()? onUnauthorized;

  ApiHelper._();

  static Future<void> init(AuthLocalDataSource authLocalDataSource) async {
    _authLocalDataSource = authLocalDataSource;

    // ⚠️ Opsional: Set initial header (tidak wajib karena onRequest interceptor sudah inject)
    final token = await _authLocalDataSource.getAccessToken();
    if (token != null && token.isNotEmpty) {
      debugPrint('✅ ApiHelper initialized with token');
    }

    _dio.interceptors.clear();
    _dio.interceptors.addAll(_buildInterceptors());
  }

  static List<Interceptor> _buildInterceptors() {
    final List<Interceptor> interceptors = [];

    // ✅ Main interceptor: inject token + auto refresh on 401
    interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          try {
            // ✅ Check if token will expire soon (proactive refresh)
            final isExpired = await _authLocalDataSource.isTokenExpired();
            if (isExpired) {
              debugPrint(
                '⏱️ Token status: EXPIRED/EXPIRING - attempting proactive refresh',
              );
              final newToken = await _performRefreshIfNeeded();
              if (newToken != null && newToken.isNotEmpty) {
                debugPrint(
                  '✅ Proactive refresh succeeded - proceeding with new token',
                );
                options.headers['Authorization'] = 'Bearer $newToken';
              } else {
                // Refresh gagal, trigger logout
                debugPrint('❌ Proactive refresh failed - triggering logout');
                onUnauthorized?.call();
              }
            } else {
              // Token still valid, use existing token
              debugPrint('✅ Token status: VALID - using existing token');
              final accessToken = await _authLocalDataSource.getAccessToken();
              if (accessToken != null && accessToken.isNotEmpty) {
                options.headers['Authorization'] = 'Bearer $accessToken';
              }
            }
          } catch (e) {
            debugPrint('❌ Error in onRequest interceptor: $e');
            // Proceed without token if error
          }
          return handler.next(options);
        },
        onError: (err, handler) async {
          // Only handle 401 Unauthorized
          if (err.response?.statusCode == 401) {
            // Prevent infinite loop with retry flag
            final retried = err.requestOptions.extra['retried'] == true;
            if (retried) {
              return handler.next(err);
            }

            try {
              // ✅ Perform refresh and get new access token directly
              final newAccess = await _performRefreshIfNeeded();

              if (newAccess == null || newAccess.isEmpty) {
                // ✅ Trigger logout callback jika refresh gagal
                onUnauthorized?.call();
                return handler.next(err);
              }

              // Mark request as retried
              err.requestOptions.extra['retried'] = true;

              // Retry original request with new token
              final response = await _dio.request<dynamic>(
                err.requestOptions.path,
                data: err.requestOptions.data,
                queryParameters: err.requestOptions.queryParameters,
                options: Options(
                  method: err.requestOptions.method,
                  headers: {
                    ...err.requestOptions.headers,
                    'Authorization': 'Bearer $newAccess',
                  },
                ),
              );

              return handler.resolve(response);
            } catch (e) {
              debugPrint('❌ Error during token refresh retry: $e');
              return handler.next(err);
            }
          }

          return handler.next(err);
        },
      ),
    );

    // Dev-only interceptors
    if (FlavorConfig.instance.flavor == Flavor.dev) {
      interceptors.add(ChuckerDioInterceptor());
      interceptors.add(
        LogInterceptor(
          request: true,
          requestBody: true,
          responseBody: true,
          error: true,
          logPrint: (object) => debugPrint(object.toString()),
        ),
      );
    }

    return interceptors;
  }

  /// Core request method
  static Future<T> request<T>({
    required String url,
    required Method method,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParams,
    required T Function(dynamic json) fromJson,
    bool isMultipart = false,
    bool useToken =
        true, // ⚠️ Parameter ini tidak digunakan karena token di-inject interceptor
  }) async {
    final options = Options(
      headers: {
        'Content-Type': isMultipart
            ? 'multipart/form-data'
            : 'application/json',
      },
    );

    try {
      late Response response;

      switch (method) {
        case Method.GET:
          response = await _dio.get(
            url,
            queryParameters: queryParams,
            options: options,
          );
          break;
        case Method.POST:
          response = await _dio.post(
            url,
            data: isMultipart ? FormData.fromMap(data ?? {}) : data,
            queryParameters: queryParams,
            options: options,
          );
          break;
        case Method.PUT:
          response = await _dio.put(
            url,
            data: isMultipart ? FormData.fromMap(data ?? {}) : data,
            queryParameters: queryParams,
            options: options,
          );
          break;
        case Method.PATCH:
          response = await _dio.patch(
            url,
            data: isMultipart ? FormData.fromMap(data ?? {}) : data,
            queryParameters: queryParams,
            options: options,
          );
          break;
        case Method.DELETE:
          response = await _dio.delete(
            url,
            data: isMultipart ? FormData.fromMap(data ?? {}) : data,
            queryParameters: queryParams,
            options: options,
          );
          break;
      }

      final json = response.data;

      // Handle List response
      if (T.toString().startsWith('List<')) {
        if (json is List) {
          return json.map((item) => fromJson(item)).toList() as T;
        } else {
          throw Exception('Expected List<dynamic> but got ${json.runtimeType}');
        }
      } else {
        return fromJson(json);
      }
    } on DioException catch (e) {
      if (e.response == null) {
        throw ServerException(e.message ?? 'Network error');
      }

      // Extract error message from response
      String errorMessage = 'Unknown error occurred';
      String? errorDetails;
      final responseData = e.response!.data;

      if (responseData is Map<String, dynamic>) {
        // Extract errors field (dapat berupa String atau List)
        if (responseData['errors'] != null) {
          if (responseData['errors'] is List) {
            final errors = responseData['errors'] as List;
            if (errors.isNotEmpty) {
              errorDetails = errors.first.toString();
            }
          } else if (responseData['errors'] is String) {
            errorDetails = responseData['errors'] as String;
          }
        }

        // Extract main message
        if (responseData['message'] != null) {
          errorMessage = responseData['message'].toString();
        } else if (responseData['data']?['message'] != null) {
          errorMessage = responseData['data']['message'].toString();
        }
      }

      // Throw appropriate exception with both message and errors
      if (e.response!.statusCode! < 500) {
        throw ClientException(errorMessage, errorDetails: errorDetails);
      } else {
        throw ServerException(errorMessage, errorDetails: errorDetails);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// ✅ FIXED: Return String? instead of bool
  /// Handles concurrent refresh attempts with Completer
  static Future<String?> _performRefreshIfNeeded() async {
    // If already refreshing, wait for the result
    if (_isRefreshing) {
      if (_refreshCompleter == null) {
        _refreshCompleter = Completer<String?>();
      }
      return _refreshCompleter!.future;
    }

    _isRefreshing = true;
    _refreshCompleter = Completer<String?>();

    try {
      final refreshToken = await _authLocalDataSource.getRefreshToken();

      if (refreshToken == null || refreshToken.isEmpty) {
        debugPrint('❌ No refresh token available');
        _refreshCompleter!.complete(null);
        return null;
      }

      debugPrint('🔄 Refreshing access token...');

      // ✅ Use the public refreshAccessToken method which handles UserID extraction
      final result = await refreshAccessToken(refreshToken);

      if (result == null) {
        debugPrint('❌ Refresh failed: no result from refreshAccessToken');
        _refreshCompleter!.complete(null);
        return null;
      }

      final newAccess = result['accessToken'] as String?;

      if (newAccess == null || newAccess.isEmpty) {
        debugPrint('❌ Refresh failed: no access token in result');
        _refreshCompleter!.complete(null);
        return null;
      }

      debugPrint('✅ Token refreshed successfully');

      _refreshCompleter!.complete(newAccess);
      return newAccess;
    } catch (e) {
      debugPrint('❌ Refresh token failed: $e');
      _refreshCompleter!.complete(null);
      return null;
    } finally {
      _isRefreshing = false;
      _refreshCompleter = null;
    }
  }

  /// ✅ Set token after login (no need to update Dio global headers)
  static Future<void> setToken(String token) async {
    await _authLocalDataSource.updateAccessToken(token);
    debugPrint('✅ Access token saved');
  }

  /// ✅ Remove all tokens on logout
  static Future<void> removeToken() async {
    await _authLocalDataSource.deleteAll();
    debugPrint('✅ All tokens cleared');
  }

  /// ✅ Public method for refreshing token (handles UserID extraction)
  static Future<Map<String, dynamic>?> refreshAccessToken(
    String refreshToken,
  ) async {
    try {
      // Extract user_id from current access token for UserID field
      final currentToken = await _authLocalDataSource.getAccessToken();
      String userId = '';
      if (currentToken != null && currentToken.isNotEmpty) {
        try {
          // Simple JWT decode (without verification for getting user_id)
          final parts = currentToken.split('.');
          if (parts.length == 3) {
            final payload = parts[1];
            // Normalize base64 string
            String normalized = payload;
            while (normalized.length % 4 != 0) {
              normalized += '=';
            }
            // Decode base64
            final decoded = String.fromCharCodes(
              const Base64Decoder().convert(normalized),
            );
            final Map<String, dynamic> jwtData = jsonDecode(decoded);
            userId = jwtData['user_id'] ?? '';
            debugPrint('✅ Extracted user_id from JWT: $userId');
          }
        } catch (e) {
          debugPrint('⚠️ Failed to decode JWT for user_id: $e');
        }
      }

      // Call refresh endpoint
      final response = await _dio.post(
        'http://8.215.33.70:8080/api/v1/auth/refresh',
        data: {
          'refreshToken': refreshToken,
          if (userId.isNotEmpty) 'UserID': userId, // ✅ Add UserID if available
        },
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      final respData = response.data;
      final tokenContainer = respData is Map && respData['data'] != null
          ? respData['data']
          : respData;

      final newAccess = tokenContainer['accessToken'] as String?;
      final newRefresh = tokenContainer['refreshToken'] as String?;
      final expiresAt = tokenContainer['expiresAt'] as int?;

      if (newAccess == null || newAccess.isEmpty) {
        return null;
      }

      await _authLocalDataSource.updateAccessToken(newAccess);

      if (newRefresh != null && newRefresh.isNotEmpty) {
        await _authLocalDataSource.updateRefreshToken(newRefresh);
      }

      if (expiresAt != null && expiresAt > 0) {
        await _authLocalDataSource.saveTokenExpiryFromTimestamp(expiresAt);
      }

      return {'accessToken': newAccess, 'refreshToken': newRefresh};
    } catch (e) {
      debugPrint('❌ Refresh token failed: $e');
      return null;
    }
  }
}
