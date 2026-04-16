import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:payroll_app/core/usecase/usecase.dart';
import 'package:payroll_app/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:payroll_app/features/profile/data/models/profile_response.dart';
import 'package:payroll_app/features/profile/domain/usecase/get_profile.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfile _getProfile;
  // final UpdateProfile _updateProfile;
  // final GetDepartments _getDepartments;
  // final GetAllDepartments _getAllDepartments;
  // final UpdateAvatar _updateAvatar;
  // final Logout _logout;
  // final UpdatePassword _updatePassword;
  final AuthLocalDataSource _authLocalDataSource;
  ProfileBloc({
    required GetProfile getProfile,
    // required UpdateProfile updateProfile,
    // required GetDepartments getDepartments,
    // required GetAllDepartments getAllDepartments,
    // required UpdateAvatar updateAvatar,
    // required Logout logout,
    // required UpdatePassword updatePassword,
    required AuthLocalDataSource authLocalDataSource,
  }) : _getProfile = getProfile,
       //  _updateProfile = updateProfile,
       //  _getDepartments = getDepartments,
       //  _getAllDepartments = getAllDepartments,
       //  _updateAvatar = updateAvatar,
       //  _logout = logout,
       //  _updatePassword = updatePassword,
       _authLocalDataSource = authLocalDataSource,
       super(ProfileInitial()) {
    on<OnGetProfile>(_onGetProfile);
    // on<OnUpdateProfile>(_onUpdateProfile);
    // on<OnGetDepartments>(_onGetDepartments);
    // on<OnGetAllDepartments>(_onGetAllDepartments);
    // on<OnUpdateAvatar>(_onUpdateAvatar);
    // on<OnLogout>(_onLogout);
    // on<ProfileReset>(_onResetProfile);
    // on<OnUpdatePassword>(_onUpdatePassword);
  }

  void _onGetProfile(OnGetProfile event, Emitter<ProfileState> emit) async {
    emit(GetProfileLoading());

    final token = await _authLocalDataSource.getAccessToken();

    if (token == null || token.isEmpty) {
      emit(GetProfileFailure(message: "Token not found"));
      return;
    }

    final result = await _getProfile.call(NoParams());
    result.fold(
      (l) {
        if (l.message.toLowerCase().contains('expired') ||
            l.message.toLowerCase().contains('unauthorized')) {
          _authLocalDataSource.deleteAll();
          emit(GetCurrentProfileExpiredToken(message: l.message));
        } else {
          emit(GetProfileFailure(message: l.message));
        }
      },
      (r) {
        emit(GetProfileSuccess(response: r));
      },
    );
  }
}
