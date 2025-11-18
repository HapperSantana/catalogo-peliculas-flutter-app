import 'package:dartz/dartz.dart';
import 'package:flutter_application/data/auth/models/signin_req_params.dart';
import 'package:flutter_application/data/auth/models/signup_req_params.dart';
import 'package:flutter_application/data/auth/sources/auth_api_service.dart';
import 'package:flutter_application/domain/auth/repositories/auth.dart';
import 'package:flutter_application/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signup(SignupReqParams params) async {
    return await sl<AuthApiService>().signup(params);
  }

  @override
  Future<Either> signin(SigninReqParams params) async {
    return await sl<AuthApiService>().signin(params);
  }
}
