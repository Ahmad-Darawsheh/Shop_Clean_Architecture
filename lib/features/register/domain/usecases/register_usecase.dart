// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:shop_app_clean/core/error/failures.dart';
import 'package:shop_app_clean/features/register/domain/entites/register_entity.dart';
import 'package:shop_app_clean/features/register/domain/repository/register_repository.dart';

class RegisterUseCase {
  RegisterRepository repository;
  RegisterUseCase({
    required this.repository,
  });
  Future<Either<Failure, RegisterEntity>> register(
      {required String email,
      required String password,
      required String phone,
      required String name}) async {
    return await repository.registerUser(
        email: email, password: password, phone: phone, name: name);
  }
}
