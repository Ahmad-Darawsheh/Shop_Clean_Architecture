import 'package:dartz/dartz.dart';
import 'package:shop_app_clean/core/error/exceptions.dart';
import 'package:shop_app_clean/core/error/failures.dart';
import 'package:shop_app_clean/features/login/data/datasources/login_remote_data_source.dart';
import 'package:shop_app_clean/features/login/domain/entites/login_entity.dart';
import 'package:shop_app_clean/features/login/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  LoginRemoteDataSource loginRemoteDataSource;
  LoginRepositoryImpl({
    required this.loginRemoteDataSource,
  });
  @override
  Future<Either<Failure, LoginEntity>> login(
      String email, String password) async {
    try {
      final result = await loginRemoteDataSource.login(email, password);

      return Right(result.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }
}
