import 'package:dartz/dartz.dart';
import 'package:shop_app_clean/core/error/failures.dart';
import 'package:shop_app_clean/features/login/domain/entites/login_entity.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginEntity>> login(String email, String password);
}