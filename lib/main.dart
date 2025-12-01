import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/core/configs/theme/app_theme.dart';
import 'package:flutter_application/presentation/splash/bloc/splash_cubit.dart';
import 'package:flutter_application/presentation/welcome/pages/welcome.dart';
import 'package:flutter_application/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return BlocProvider(
      create: (context) => SplashCubit()..appStarted(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.appTheme,
          home: const WelcomePage()),
    );
  }
}
