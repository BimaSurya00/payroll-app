import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<void> saveAccessToken(String token);
  Future<void> saveRefreshToken(String token);
  Future<void> saveRole(String role);
  // ✅ Updated: Support both duration and timestamp
  Future<void> saveTokenExpiry(int expiresIn);
  Future<void> saveTokenExpiryFromTimestamp(
    int expiresAt,
  ); // ← Add: For Unix timestamp

  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();
  Future<String?> getRole();
  Future<int?> getTokenExpiry();
  Future<bool> isTokenExpired();

  Future<void> updateAccessToken(String token);
  Future<void> updateRefreshToken(String token);

  Future<int> deleteAll();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;

  AuthLocalDataSourceImpl({required this.sharedPreferences});

  static const String _accessTokenKey = 'accessToken';
  static const String _refreshTokenKey = 'refreshToken';
  static const String _roleKey = 'role';
  static const String _tokenExpiryKey = 'tokenExpiry'; // New: expiry timestamp

  @override
  Future<void> saveAccessToken(String token) async {
    await sharedPreferences.setString(_accessTokenKey, token);
  }

  @override
  Future<void> saveRefreshToken(String token) async {
    await sharedPreferences.setString(_refreshTokenKey, token);
  }

  @override
  Future<void> saveRole(String role) async {
    await sharedPreferences.setString(_roleKey, role);
  }

  @override
  Future<String?> getAccessToken() async {
    return sharedPreferences.getString(_accessTokenKey);
  }

  @override
  Future<String?> getRefreshToken() async {
    return sharedPreferences.getString(_refreshTokenKey);
  }

  @override
  Future<String?> getRole() async {
    return sharedPreferences.getString(_roleKey);
  }

  @override
  Future<void> updateAccessToken(String token) async {
    await sharedPreferences.setString(_accessTokenKey, token);
  }

  @override
  Future<void> updateRefreshToken(String token) async {
    await sharedPreferences.setString(_refreshTokenKey, token);
  }

  @override
  Future<int> deleteAll() async {
    await sharedPreferences.remove(_accessTokenKey);
    await sharedPreferences.remove(_refreshTokenKey);
    await sharedPreferences.remove(_roleKey);
    await sharedPreferences.remove(_tokenExpiryKey);
    return 0;
  }

  // ✅ New methods for token expiry management
  @override
  Future<void> saveTokenExpiry(int expiresIn) async {
    // expiresIn is in seconds, convert to milliseconds and store as timestamp
    final expiryTime =
        DateTime.now().millisecondsSinceEpoch + (expiresIn * 1000);
    await sharedPreferences.setInt(_tokenExpiryKey, expiryTime);
  }

  // ✅ New: Save expiry from Unix timestamp (from backend expiresAt)
  @override
  Future<void> saveTokenExpiryFromTimestamp(int expiresAt) async {
    // expiresAt is Unix timestamp in seconds, convert to milliseconds
    final expiryTime = expiresAt * 1000;

    debugPrint('💾 Saving token expiry from timestamp:');
    debugPrint('   expiresAt (seconds): $expiresAt');
    debugPrint('   expiryTime (ms): $expiryTime');
    debugPrint(
      '   expiryTime datetime: ${DateTime.fromMillisecondsSinceEpoch(expiryTime)}',
    );
    debugPrint('   Current time: ${DateTime.now()}');

    final durationMs = expiryTime - DateTime.now().millisecondsSinceEpoch;
    debugPrint(
      '   Duration until expiry: ${(durationMs / 1000).toStringAsFixed(0)}s = ${(durationMs / 60000).toStringAsFixed(2)}min',
    );

    await sharedPreferences.setInt(_tokenExpiryKey, expiryTime);
  }

  @override
  Future<int?> getTokenExpiry() async {
    return sharedPreferences.getInt(_tokenExpiryKey);
  }

  @override
  Future<bool> isTokenExpired() async {
    final expiry = await getTokenExpiry();
    if (expiry == null) {
      return false;
    }

    final now = DateTime.now().millisecondsSinceEpoch;
    final timeUntilExpiry = expiry - now;
    final minutesLeft = timeUntilExpiry / 60000;

    return minutesLeft < 2.0;
  }
}
