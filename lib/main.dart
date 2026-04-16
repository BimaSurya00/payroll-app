import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:payroll_app/blocs.dart';
import 'package:payroll_app/core/api/api_helper.dart';
import 'package:payroll_app/cubits.dart';
import 'package:payroll_app/core/config/app_config.dart';
import 'package:payroll_app/features/splash/presentation/pages/splash_page.dart';
import 'package:payroll_app/init_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  FlavorConfig.initialize(flavor: Flavor.dev);
  await initDependencies();

  // ✅ Setup auto-logout callback dari ApiHelper
  // Callback akan dipanggil saat token refresh gagal
  ApiHelper.onUnauthorized = () {
    debugPrint('🔴 ApiHelper: Token unauthorized - triggering auto-logout');
    // Callback ini akan dipanggil oleh ApiHelper saat 401 terjadi
    // AuthBloc setup callback di constructor-nya
  };

  runApp(
    MultiBlocProvider(providers: [...blocs, ...cubits], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Payroll App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2563EB)),
        useMaterial3: true,
      ),
      home: const SplashPage(),
    );
  }
}
