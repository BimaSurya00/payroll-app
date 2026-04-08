part of 'init_dependencies.dart';

final serviceLocator = GetIt.instance;
final _dio = Dio(BaseOptions(connectTimeout: Duration(seconds: 15)));

Future<void> initDependencies() async {
  _initAuth();

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
    // ..registerFactory<ProfileRemoteDatasource>(
    //   () => ProfileRemoteDatasourceImpl(),
    // )
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(
        remoteDatasource: serviceLocator(),
        authLocalDataSource: serviceLocator(),
        connectionChecker: serviceLocator(),
      ),
    )
    // ..registerFactory<ProfileRepository>(
    //   () => ProfileRepositoryImpl(
    //     authLocalDataSource: serviceLocator(),
    //     remoteDatasource: serviceLocator(),
    //     connectionChecker: serviceLocator(),
    //   ),
    // )
    ..registerFactory<Login>(() => Login(serviceLocator()))
    // ..registerFactory<Register>(() => Register(serviceLocator()))
    // ..registerFactory<Logout>(() => Logout(serviceLocator()))
    // ..registerFactory<SendOtp>(() => SendOtp(serviceLocator()))
    // ..registerFactory<RefreshToken>(() => RefreshToken(serviceLocator()))
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
        // sendOtp: serviceLocator(), 
        // verifOtp: serviceLocator(),
        // resetPassword: serviceLocator(),
        // refreshToken: serviceLocator(),
        authLocalDataSource: serviceLocator(),
      ),
    );
}