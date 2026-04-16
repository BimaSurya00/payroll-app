part of 'auth_bloc.dart';

// ✅ Logout reason enum
enum LogoutReason { manual, tokenExpired }

@immutable
sealed class AuthEvent {}

final class OnLogin extends AuthEvent {
  final LoginRequest request;

  OnLogin({required this.request});
}

// final class OnRegister extends AuthEvent {
//   final RegisterRequest request;

//   OnRegister({required this.request});
// }

final class AuthSendOtp extends AuthEvent {
  final String phone;

  AuthSendOtp({required this.phone});
}

final class AuthVerifOtp extends AuthEvent {
  final String otp;
  final String phone;

  AuthVerifOtp({required this.otp, required this.phone});
}

final class OnResetPassword extends AuthEvent {
  final String otp;
  final String phone;
  final String password;

  OnResetPassword({
    required this.otp,
    required this.phone,
    required this.password,
  });
}

final class OnRefreshToken extends AuthEvent {}

final class OnAuthLogout extends AuthEvent {
  final LogoutReason reason;

  OnAuthLogout(this.reason); // ✅ Optional reason parameter
}
