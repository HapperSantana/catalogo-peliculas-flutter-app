import 'package:dartz/dartz.dart';
import 'package:flutter_application/data/auth/models/signin_req_params.dart';

import '../../../data/auth/models/signup_req_params.dart';

abstract class AuthRepository {
  Future<Either> signup(SignupReqParams params);
  Future<Either> signin(SigninReqParams params);
}
