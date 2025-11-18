import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/common/helper/message/display_message.dart';
import 'package:flutter_application/common/helper/navigation/app_navigation.dart';
import 'package:flutter_application/core/configs/theme/app_colors.dart';
import 'package:flutter_application/data/auth/models/signin_req_params.dart';
import 'package:flutter_application/domain/auth/usecases/signin.dart';
import 'package:flutter_application/presentation/auth/pages/signup.dart';
import 'package:flutter_application/service_locator.dart';
import 'package:reactive_button/reactive_button.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            minimum: EdgeInsets.only(top: 100, right: 16, left: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _signinText(),
                SizedBox(
                  height: 30,
                ),
                _emailField(),
                SizedBox(
                  height: 10,
                ),
                _passwordField(),
                SizedBox(
                  height: 60,
                ),
                _signinButton(context),
                SizedBox(
                  height: 20,
                ),
                _signupText(context)
              ],
            )));
  }

  Widget _signinText() {
    return Text(
      'Iniciar Sesión',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
    );
  }

  Widget _emailField() {
    return TextField(
      controller: _emailController,
      decoration: const InputDecoration(hintText: 'Email'),
    );
  }

  Widget _passwordField() {
    return TextField(
      controller: _passwordController,
      decoration: const InputDecoration(hintText: 'Contraseña'),
    );
  }

  Widget _signinButton(BuildContext context) {
    return ReactiveButton(
        title: 'Ingresar',
        activeColor: AppColors.primary,
        onPressed: () async => sl<SigninUseCase>().call(SigninReqParams(
            email: _emailController.text, password: _passwordController.text)),
        onSuccess: () {},
        onFailure: (error) {
          DisplayMessage.errorMessage(error, context);
        });
  }

  Widget _signupText(BuildContext context) {
    return Text.rich(TextSpan(children: [
      TextSpan(text: "No tienes una cuenta ?"),
      TextSpan(
          text: ' Registrarme',
          style: TextStyle(color: Colors.blue),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              AppNavigator.push(context, SignupPage());
            })
    ]));
  }
}
