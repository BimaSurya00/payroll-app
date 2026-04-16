part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class LoginLoading extends AuthState {}

final class LoginFailure extends AuthState {
  final String message;
  final String? errors;

  LoginFailure({required this.message, this.errors});
}

final class LoginSuccess extends AuthState {
  final LoginResponse response;

  LoginSuccess({required this.response});
}

// register

final class RegisterLoading extends AuthState {}

final class RegisterFailure extends AuthState {
  final String message;
  final String? errors;

  RegisterFailure({required this.message, this.errors});
}

// final class RegisterSuccess extends AuthState {
//   final RegisterResponse response;

//   RegisterSuccess({required this.response});
// }

// Send Otp

final class AuthSendOtpLoading extends AuthState {}

final class AuthSendOtpSuccess extends AuthState {
  final String message;

  AuthSendOtpSuccess(this.message);
}

final class AuthSendOtpFailure extends AuthState {
  final String message;

  AuthSendOtpFailure(this.message);
}

// Verif Otp

final class AuthVerifOtpLoading extends AuthState {}

final class AuthVerifOtpSuccess extends AuthState {
  final String message;

  AuthVerifOtpSuccess(this.message);
}

final class AuthVerifOtpFailure extends AuthState {
  final String message;

  AuthVerifOtpFailure(this.message);
}

// Reset Password

final class ResetPasswordLoading extends AuthState {}

final class ResetPasswordSuccess extends AuthState {
  final String message;

  ResetPasswordSuccess(this.message);
}

final class ResetPasswordFailure extends AuthState {
  final String message;

  ResetPasswordFailure(this.message);
}

// refresh token

final class RefreshTokenLoading extends AuthState {}

final class RefreshTokenSuccess extends AuthState {
  final LoginResponse response;
  RefreshTokenSuccess(this.response);
}

final class RefreshTokenFailure extends AuthState {
  final String message;
  RefreshTokenFailure(this.message);
}

// Auth Logout

final class AuthLogoutLoading extends AuthState {}

final class AuthLogoutSuccess extends AuthState {
  final String message;

  AuthLogoutSuccess(this.message);
}

final class AuthLogoutFailure extends AuthState {
  final String message;

  AuthLogoutFailure(this.message);
}
