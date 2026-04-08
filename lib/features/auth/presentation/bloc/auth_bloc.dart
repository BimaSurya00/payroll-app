import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:payroll_app/core/api/api_helper.dart';
import 'package:payroll_app/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:payroll_app/features/auth/data/models/login_request.dart';
import 'package:payroll_app/features/auth/data/models/login_response.dart';
import 'package:payroll_app/features/auth/domain/usecase/login.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Login _login;
  // final Register _register;
  // final FirebaseAnalytics _analytics;
  // final SendOtp _sendOtp;
  // final VerifOtp _verifOtp;
  // final r.ResetPassword _resetPassword;
  // final RefreshToken _refreshToken;
  final AuthLocalDataSource _authLocalDataSource;
  AuthBloc({
    required Login login,
    // required Register register,
    // required SendOtp sendOtp,
    // required VerifOtp verifOtp,
    // required RefreshToken refreshToken,
    // required r.ResetPassword resetPassword,
    // FirebaseAnalytics? analytics,
    required AuthLocalDataSource authLocalDataSource,
  }) : _login = login,
       // _register = register,
       // _sendOtp = sendOtp,
       // _verifOtp = verifOtp,
       // _resetPassword = resetPassword,
       // _refreshToken = refreshToken,
       // _analytics = analytics ?? FirebaseAnalytics.instance,
       _authLocalDataSource = authLocalDataSource,
       super(AuthInitial()) {
    on<OnLogin>(_onLogin);
    // on<OnRegister>(_onRegister);
    // on<AuthSendOtp>(_onAuthSendOtp);
    // on<AuthVerifOtp>(_onAuthVerifOtp);
    // on<OnResetPassword>(_onAuthResetPasswordOtp);
    // on<OnRefreshToken>(_onRefreshToken);
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
        if (access != null) {
          await _authLocalDataSource.updateAccessToken(access);
          await ApiHelper.setToken(access);
        }

        if (refresh != null) {
          await _authLocalDataSource.updateRefreshToken(refresh);
        }
        // await _analytics.logEvent(
        //   name: "login_success",
        //   parameters: {
        //     'email': r.data?.user?.email ?? '',
        //     'role': r.data?.user?.role ?? '',
        //     'login_method': 'manual',
        //   },
        // );

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
}
