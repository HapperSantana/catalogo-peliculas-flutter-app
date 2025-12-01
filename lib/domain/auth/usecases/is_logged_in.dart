import 'package:flutter_application/core/usecase/usecase.dart';
import 'package:flutter_application/domain/auth/repositories/auth.dart';
import 'package:flutter_application/service_locator.dart';

class IsLoggedInUseCase implements Usecase<bool, dynamic> {
  @override
  Future<bool> call(params) async {
    // Implement the logic to check if the user is logged in
    // This is a placeholder implementation
    return await sl<AuthRepository>().isLoggedIn();
  }
}
