import 'package:dartz/dartz.dart';
import 'package:flutter_application/core/usecase/usecase.dart';
import 'package:flutter_application/data/auth/models/signup_req_params.dart';
import 'package:flutter_application/domain/auth/repositories/auth.dart';
import 'package:flutter_application/service_locator.dart';

class SignupUseCase extends Usecase<Either, SignupReqParams> {
  @override
  Future<Either> call(SignupReqParams? params) async {
    return await sl<AuthRepository>().signup(params!);
  }
}
