// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_application/common/helper/navigation/app_navigation.dart';
import 'package:flutter_application/core/configs/assets/app_images.dart';
import 'package:flutter_application/presentation/auth/pages/signin.dart';
import 'package:flutter_application/presentation/home/pages/home.dart';
import 'package:flutter_application/presentation/splash/bloc/splash_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/splash_state.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is UnAuthenticated) {
            AppNavigator.pushReplacement(context, SigninPage());
          }
          if (state is Authenticated) {
            AppNavigator.pushReplacement(context, HomePage());
          }
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AppImages.splashBackgorund))),
            ),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color(0xff1A1B20).withOpacity(0),
                    Color(0xff1A1B20)
                  ])),
            )
          ],
        ),
      ),
    );
  }
}
