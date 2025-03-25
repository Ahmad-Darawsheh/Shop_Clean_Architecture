import 'package:dartz/dartz.dart';
import 'package:shop_app_clean/core/error/failures.dart';
import 'package:shop_app_clean/features/authenticate/domain/entites/login_entity/login_entity.dart';
import 'package:shop_app_clean/features/authenticate/domain/repositories/login_repsitory/login_repository.dart';

class LoginUseCase {
  final LoginRepository loginRepository;

  LoginUseCase({required this.loginRepository});
  

  Future<Either<Failure, LoginEntity>> login(String email, String password) async {
    return await loginRepository.login(email, password);
  }
}
