import 'package:dartz/dartz.dart';
import 'package:flutter_application/core/usecase/usecase.dart';
import 'package:flutter_application/data/auth/models/signin_req_params.dart';
import 'package:flutter_application/domain/auth/repositories/auth.dart';
import 'package:flutter_application/service_locator.dart';

class SigninUseCase extends Usecase<Either, SigninReqParams> {
  @override
  Future<Either> call(SigninReqParams? params) async {
    return await sl<AuthRepository>().signin(params!);
  }
}
