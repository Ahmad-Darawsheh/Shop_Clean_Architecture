import 'package:dartz/dartz.dart';
import 'package:shop_app_clean/core/error/failures.dart';
import 'package:shop_app_clean/features/authenticate/domain/entites/register_entity/register_entity.dart';

abstract class RegisterRepository {
  Future<Either<Failure, RegisterEntity>> registerUser(
      {required String name,
      required String email,
      required String phone,
      required String password});
}
