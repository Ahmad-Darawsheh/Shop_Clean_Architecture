import 'package:dartz/dartz.dart';
import 'package:shop_app_clean/core/error/exceptions.dart';
import 'package:shop_app_clean/core/error/failures.dart';
import 'package:shop_app_clean/features/register/data/datasources/register_remote_data_source.dart';
import 'package:shop_app_clean/features/register/domain/entites/register_entity.dart';
import 'package:shop_app_clean/features/register/domain/repository/register_repository.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  RegisterRemoteDataSource registerRemoteDataSource;
  RegisterRepositoryImpl({
    required this.registerRemoteDataSource,
  });

  @override
  Future<Either<Failure, RegisterEntity>> registerUser(
      {required String name,
      required String email,
      required String phone,
      required String password}) async {
    try {
      final result = await registerRemoteDataSource.register(
          email: email, password: password, name: name, phone: phone);
      return Right(result.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }
}
