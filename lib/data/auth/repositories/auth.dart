import 'package:dartz/dartz.dart';
import 'package:flutter_application/data/auth/models/signin_req_params.dart';
import 'package:flutter_application/data/auth/models/signup_req_params.dart';
import 'package:flutter_application/data/auth/sources/auth_firebase_service.dart';
import 'package:flutter_application/domain/auth/repositories/auth.dart';
import 'package:flutter_application/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signup(SignupReqParams params) async {
    return await sl<AuthFirebaseService>().signup(params);
  }

  @override
  Future<Either> signin(SigninReqParams params) async {
    return await sl<AuthFirebaseService>().signin(params);
  }

  @override
  Future<bool> isLoggedIn() async {
    return await sl<AuthFirebaseService>().isLoggedIn();
  }
}
