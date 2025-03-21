import 'package:dartz/dartz.dart';
import 'package:shop_app_clean/core/error/failures.dart';
import 'package:shop_app_clean/features/login/domain/entites/login_entity.dart';
import 'package:shop_app_clean/features/login/domain/repositories/login_repository.dart';

class LoginUseCase {
  final LoginRepository loginRepository;

  LoginUseCase({required this.loginRepository});
  

  Future<Either<Failure, LoginEntity>> login(String email, String password) async {
    return await loginRepository.login(email, password);
  }
}
