import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:payroll_app/core/api/api_helper.dart';
import 'package:payroll_app/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:payroll_app/features/auth/data/models/login_request.dart';
import 'package:payroll_app/features/auth/data/models/login_response.dart';
import 'package:payroll_app/features/auth/domain/usecase/login.dart';
import 'package:payroll_app/features/auth/domain/usecase/logout.dart';
import 'package:payroll_app/features/auth/domain/usecase/refresh_token.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Login _login;
  final AuthLogout _authLogout;
  final RefreshToken _refreshToken;
  final AuthLocalDataSource _authLocalDataSource;

  AuthBloc({
    required Login login,
    required AuthLogout authLogout,
    required RefreshToken refreshToken,
    required AuthLocalDataSource authLocalDataSource,
  }) : _login = login,
       _authLogout = authLogout,
       _refreshToken = refreshToken,
       _authLocalDataSource = authLocalDataSource,
       super(AuthInitial()) {
    on<OnLogin>(_onLogin);
    on<OnAuthLogout>(_onAuthLogout);
    on<OnRefreshToken>(_onRefreshToken);

    // ✅ Setup auto-logout callback untuk ApiHelper
    _setupAutoLogoutCallback();
  }

  // ✅ Setup callback ketika token refresh gagal (auto-logout)
  void _setupAutoLogoutCallback() {
    ApiHelper.onUnauthorized = () {
      debugPrint('🔴 Token unauthorized - triggering auto-logout');
      add(OnAuthLogout(LogoutReason.tokenExpired));
    };
  }

  void _onLogin(OnLogin event, Emitter<AuthState> emit) async {
    emit(LoginLoading());
    final result = await _login.call(
      LoginRequest(
        email: event.request.email,
        password: event.request.password,
      ),
    );

    await result.fold(
      (l) async {
        emit(LoginFailure(message: l.message, errors: l.errorDetails));
      },
      (r) async {
        final access = r.data?.accessToken;
        final refresh = r.data?.refreshToken;
        final expiresAt = r.data?.expiresAt;

        if (access != null) {
          await _authLocalDataSource.updateAccessToken(access);
          await ApiHelper.setToken(access);
        }

        if (refresh != null) {
          await _authLocalDataSource.updateRefreshToken(refresh);
        }

        if (expiresAt != null && expiresAt > 0) {
          await _authLocalDataSource.saveTokenExpiryFromTimestamp(expiresAt);
        }

        emit(LoginSuccess(response: r));
      },
    );
  }

  // void _onRegister(OnRegister event, Emitter<AuthState> emit) async {
  //   emit(RegisterLoading());
  //   final response = await _register.call(
  //     RegisterRequest(
  //       username: event.request.username,
  //       email: event.request.email,
  //       division: event.request.division,
  //       password: event.request.password,
  //       confirmPassword: event.request.confirmPassword,
  //     ),
  //   );

  //   response.fold(
  //     (l) => emit(RegisterFailure(message: l.message, errors: l.errorDetails)),
  //     (r) => emit(RegisterSuccess(response: r)),
  //   );
  // }

  // void _onAuthSendOtp(AuthSendOtp event, Emitter emit) async {
  //   emit(AuthSendOtpLoading());

  //   final response = await _sendOtp.call(SendOtpParams(phone: event.phone));

  //   response.fold(
  //     (l) => emit(AuthSendOtpFailure(l.message)),
  //     (r) => emit(AuthSendOtpSuccess(r)),
  //   );
  // }

  // void _onAuthVerifOtp(AuthVerifOtp event, Emitter emit) async {
  //   emit(AuthVerifOtpLoading());

  //   final response = await _verifOtp.call(
  //     VerifOtpParams(phone: event.phone, otp: event.otp),
  //   );

  //   response.fold(
  //     (l) => emit(AuthVerifOtpFailure(l.message)),
  //     (r) => emit(AuthVerifOtpSuccess(r)),
  //   );
  // }

  // void _onAuthResetPasswordOtp(OnResetPassword event, Emitter emit) async {
  //   emit(ResetPasswordLoading());

  //   final response = await _resetPassword.call(
  //     r.ResetPasswordParams(
  //       password: event.password,
  //       phone: event.phone,
  //       otp: event.otp,
  //     ),
  //   );

  //   response.fold(
  //     (l) => emit(ResetPasswordFailure(l.message)),
  //     (r) => emit(ResetPasswordSuccess(r)),
  //   );
  // }

  // Future<void> _onRefreshToken(
  //     OnRefreshToken event, Emitter<AuthState> emit) async {
  //   emit(RefreshTokenLoading());

  //   final refresh = await _authLocalDataSource.getRefreshToken();
  //   if (refresh == null) {
  //     emit(RefreshTokenFailure("Refresh token tidak ditemukan"));
  //     return;
  //   }

  //   final result = await _refreshToken(
  //     RefreshTokenParams(refreshToken: refresh),
  //   );

  //   result.fold(
  //     (failure) {
  //       emit(RefreshTokenFailure(failure.message));

  //       // Jika refresh token invalid, user harus logout
  //       if (failure.message.contains("expired") ||
  //           failure.message.contains("invalid")) {
  //         _authLocalDataSource.deleteAll();
  //       }
  //     },
  //     (success) async {
  //       final newAccess = success.dataLogin?.accessToken;
  //       final newRefresh = success.dataLogin?.refreshToken;

  //       if (newAccess != null) {
  //         await _authLocalDataSource.updateAccessToken(newAccess);
  //         await ApiHelper.setToken(newAccess);
  //       }

  //       if (newRefresh != null) {
  //         await _authLocalDataSource.updateRefreshToken(newRefresh);
  //       }

  //       emit(RefreshTokenSuccess(success));
  //     },
  //   );
  // }

  Future<void> _onRefreshToken(
    OnRefreshToken event,
    Emitter<AuthState> emit,
  ) async {
    emit(RefreshTokenLoading());

    final refresh = await _authLocalDataSource.getRefreshToken();
    if (refresh == null || refresh.isEmpty) {
      emit(RefreshTokenFailure("Refresh token tidak ditemukan"));
      return;
    }

    final result = await _refreshToken.call(
      RefreshTokenParams(refreshToken: refresh),
    );

    result.fold(
      (failure) async {
        emit(RefreshTokenFailure(failure.message));

        // Jika refresh token invalid, user harus logout
        if (failure.message.contains("expired") ||
            failure.message.contains("invalid") ||
            failure.message.contains("unauthorized")) {
          await _authLocalDataSource.deleteAll();
          // ✅ Trigger logout otomatis
          add(OnAuthLogout(LogoutReason.tokenExpired));
        }
      },
      (success) async {
        final newAccess = success.data?.accessToken;
        final newRefresh = success.data?.refreshToken;
        final expiresAt = success.data?.expiresAt;

        if (newAccess != null && newAccess.isNotEmpty) {
          await _authLocalDataSource.updateAccessToken(newAccess);
          await ApiHelper.setToken(newAccess);
        }

        if (newRefresh != null && newRefresh.isNotEmpty) {
          await _authLocalDataSource.updateRefreshToken(newRefresh);
        }

        if (expiresAt != null && expiresAt > 0) {
          await _authLocalDataSource.saveTokenExpiryFromTimestamp(expiresAt);
        }

        emit(RefreshTokenSuccess(success));
      },
    );
  }

  void _onAuthLogout(OnAuthLogout event, Emitter emit) async {
    emit(AuthLogoutLoading());

    final refreshToken = await _authLocalDataSource.getRefreshToken();
    if (refreshToken == null || refreshToken.isEmpty) {
      // No refresh token — just clear local and succeed
      await _authLocalDataSource.deleteAll();
      emit(AuthLogoutSuccess('Logged out'));
      return;
    }

    final response = await _authLogout.call(
      AuthLogoutParams(refreshToken: refreshToken),
    );

    response.fold(
      // Even on API failure, local tokens are already cleared in repository
      (l) => emit(AuthLogoutSuccess('Logged out')),
      (r) => emit(AuthLogoutSuccess(r)),
    );
  }
}
