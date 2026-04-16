part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class GetProfileLoading extends ProfileState {}

final class GetProfileFailure extends ProfileState {
  final String message;

  GetProfileFailure({required this.message});
}

final class GetCurrentProfileExpiredToken extends ProfileState {
  final String message;

  GetCurrentProfileExpiredToken({required this.message});
}

final class GetProfileSuccess extends ProfileState {
  final ProfileResponse response;

  GetProfileSuccess({required this.response});
}
