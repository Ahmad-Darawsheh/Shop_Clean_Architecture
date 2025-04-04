import 'package:dartz/dartz.dart';
import 'package:shop_app_clean/core/error/exceptions.dart';
import 'package:shop_app_clean/core/error/failures.dart';
import 'package:shop_app_clean/features/authenticate/data/datasources/local_storage_data_source.dart';
import 'package:shop_app_clean/features/authenticate/data/datasources/login_remote_data_source/login_remote_data_source.dart';
import 'package:shop_app_clean/features/authenticate/domain/entites/login_entity/login_entity.dart';
import 'package:shop_app_clean/features/authenticate/domain/repositories/login_repsitory/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource loginRemoteDataSource;
  final LocalStorageDataSource localStorageDataSource;
  LoginRepositoryImpl({
    required this.loginRemoteDataSource,
    required this.localStorageDataSource,
  });
  @override
  Future<Either<Failure, LoginEntity>> login(
      String email, String password) async {
    try {
      final result = await loginRemoteDataSource.login(email, password);
      localStorageDataSource.saveToken(result.token);

      return Right(result.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }
}
