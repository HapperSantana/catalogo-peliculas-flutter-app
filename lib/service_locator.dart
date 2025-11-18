import 'package:flutter_application/core/network/dio_client.dart';
import 'package:flutter_application/data/auth/sources/auth_api_service.dart';
import 'package:flutter_application/data/auth/repositories/auth.dart';
import 'package:flutter_application/domain/auth/repositories/auth.dart';
import 'package:flutter_application/domain/auth/usecases/signup.dart';
import 'package:flutter_application/domain/auth/usecases/signin.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());

  //Services
  sl.registerSingleton<AuthApiService>(AuthApiServiceImpl());

  //Repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  //Usecases
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());
}
