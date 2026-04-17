part of 'init_dependencies.dart';

final serviceLocator = GetIt.instance;
final _dio = Dio(BaseOptions(connectTimeout: Duration(seconds: 15)));

Future<void> initDependencies() async {
  _initAuth();
  _initAttendance();
  _initCompany();

  final sharedPreferences = await SharedPreferences.getInstance();

  serviceLocator
    ..registerLazySingleton(() => _dio)
    ..registerLazySingleton<SharedPreferences>(() => sharedPreferences)
    ..registerFactory<InternetConnection>(() => InternetConnection())
    ..registerLazySingleton<ConnectionChecker>(
      () => ConnectionCheckerImpl(serviceLocator()),
    );

  await ApiHelper.init(serviceLocator<AuthLocalDataSource>());
}

void _initAuth() {
  serviceLocator
    ..registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(serviceLocator()),
    )
    ..registerFactory<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(sharedPreferences: serviceLocator()),
    )
    ..registerFactory<ProfileRemoteDataSource>(
      () => ProfileRemoteDataSourceImpl(),
    )
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(
        remoteDatasource: serviceLocator(),
        authLocalDataSource: serviceLocator(),
        connectionChecker: serviceLocator(),
      ),
    )
    ..registerFactory<ProfileRepository>(
      () => ProfileRepositoryImpl(
        authLocalDataSource: serviceLocator(),
        connectionChecker: serviceLocator(),
        profileRemoteDataSource: serviceLocator(),
      ),
    )
    ..registerFactory<Login>(() => Login(serviceLocator()))
    ..registerFactory<AuthLogout>(() => AuthLogout(serviceLocator()))
    ..registerFactory<RefreshToken>(() => RefreshToken(serviceLocator()))
    ..registerFactory<GetProfile>(() => GetProfile(serviceLocator()))
    // ..registerFactory<VerifOtp>(() => VerifOtp(serviceLocator()))
    // ..registerFactory<ResetPassword>(() => ResetPassword(serviceLocator()))
    // ..registerFactory<GetProfile>(() => GetProfile(serviceLocator()))
    // ..registerFactory<UpdateProfile>(() => UpdateProfile(serviceLocator()))
    // ..registerFactory<UpdateAvatar>(() => UpdateAvatar(serviceLocator()))
    // ..registerFactory<GetDepartments>(() => GetDepartments(serviceLocator()))
    // ..registerFactory<GetAllDepartments>(
    //   () => GetAllDepartments(serviceLocator()),
    // )
    // ..registerFactory<UpdatePassword>(() => UpdatePassword(serviceLocator()))
    // ..registerLazySingleton(() => PasswordVisibilityCubit())
    // ..registerLazySingleton(() => NewPasswordVisibilityCubit())
    // ..registerLazySingleton(() => ConfirmPasswordVisibilityCubit())
    // ..registerLazySingleton(
    //   () => ProfileBloc(
    //     getProfile: serviceLocator(),
    //     getDepartments: serviceLocator(),
    //     getAllDepartments: serviceLocator(),
    //     updateProfile: serviceLocator(),
    //     updateAvatar: serviceLocator(),
    //     logout: serviceLocator(),
    //     updatePassword: serviceLocator(),
    //     authLocalDataSource: serviceLocator(),
    //   ),
    // )
    // ..registerLazySingleton(() => ProfileCubit())
    // ..registerLazySingleton(() => TimerBloc(ticker: Ticker()))
    ..registerLazySingleton(
      () => AuthBloc(
        // register: serviceLocator(),
        login: serviceLocator(),
        authLogout: serviceLocator(),
        refreshToken: serviceLocator(),
        // sendOtp: serviceLocator(),
        // verifOtp: serviceLocator(),
        // resetPassword: serviceLocator(),
        authLocalDataSource: serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => ProfileBloc(
        getProfile: serviceLocator(),
        authLocalDataSource: serviceLocator(),
      ),
    );
}

void _initAttendance() {
  serviceLocator
    ..registerFactory<AttendanceRemoteDataSource>(
      () => AttendanceRemoteDataSourceImpl(),
    )
    ..registerFactory<AttendanceRepository>(
      () => AttendanceRepositoryImpl(
        remoteDataSource: serviceLocator(),
        connectionChecker: serviceLocator(),
      ),
    )
    ..registerFactory<ClockIn>(() => ClockIn(serviceLocator()))
    ..registerFactory<ClockOut>(() => ClockOut(serviceLocator()))
    ..registerFactory<GetAttendanceStatus>(
      () => GetAttendanceStatus(serviceLocator()),
    )
    ..registerFactory<GetAttendanceHistory>(
      () => GetAttendanceHistory(serviceLocator()),
    )
    ..registerLazySingleton(
      () => AttendanceBloc(
        clockIn: serviceLocator(),
        clockOut: serviceLocator(),
        getAttendanceStatus: serviceLocator(),
        getAttendanceHistory: serviceLocator(),
      ),
    );
}

void _initCompany() {
  serviceLocator
    ..registerFactory<CompanyRemoteDataSource>(
      () => CompanyRemoteDataSourceImpl(),
    )
    ..registerFactory<CompanyRepository>(
      () => CompanyRepositoryImpl(
        remoteDataSource: serviceLocator(),
        connectionChecker: serviceLocator(),
      ),
    )
    ..registerFactory<GetCurrentCompany>(
      () => GetCurrentCompany(serviceLocator()),
    );
}
