import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/common/helper/navigation/app_navigation.dart';
import 'package:flutter_application/core/configs/theme/app_colors.dart';
import 'package:flutter_application/presentation/auth/pages/signin.dart';
import 'package:flutter_application/services/auth_service.dart';
import 'package:reactive_button/reactive_button.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String errorMessage = '';

  void register() async {
    try {
      await authService.value.createAccount(
          email: _emailController.text, password: _passwordController.text);
      popPage();
    } on FirebaseAuthException catch (e) {
      print(e.message);
      setState(() {
        errorMessage =
            e.message ?? 'Ocurrio un error durante el registro del usuario.';
      });
    }
  }

  void popPage() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            minimum: EdgeInsets.only(top: 100, right: 16, left: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _signupText(),
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
                _signupButton(context),
                SizedBox(
                  height: 10,
                ),
                _errorText(context),
                SizedBox(
                  height: 20,
                ),
                _signinText(context)
              ],
            )));
  }

  Widget _signupText() {
    return Text(
      'Registro',
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

  Widget _signupButton(BuildContext context) {
    return ReactiveButton(
        title: 'Registrar',
        activeColor: AppColors.primary,
        onPressed: () async {
          register();
          return true;
        },
        onSuccess: () {
          AppNavigator.push(context, SigninPage());
        },
        onFailure: (error) {
          //DisplayMessage.errorMessage(error, context);
        });
  }

  Widget _signinText(BuildContext context) {
    return Text.rich(TextSpan(children: [
      TextSpan(text: "Ya tienes una cuenta ? "),
      TextSpan(
          text: ' Iniciar Sesión',
          style: TextStyle(color: Colors.blue),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              AppNavigator.push(context, SigninPage());
            })
    ]));
  }

  Widget _errorText(BuildContext context) {
    return Text(
      errorMessage,
      style: TextStyle(color: Colors.red),
    );
  }
}
