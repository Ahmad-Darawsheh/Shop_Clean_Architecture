import 'package:dartz/dartz.dart';
import 'package:shop_app_clean/core/error/failures.dart';
import 'package:shop_app_clean/features/home/data/datasource/home_remote_data_source.dart';
import 'package:shop_app_clean/features/home/domain/entity/product_entity/home_product_entity.dart';
import 'package:shop_app_clean/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  HomeRemoteDataSource homeRemoteDataSource;
  HomeRepositoryImpl({required this.homeRemoteDataSource});
  @override
  Future<Either<Failure, HomeProductEntity>> getHomeProducts() async {
    try {
      final response = await homeRemoteDataSource.getHomeProducts();
      
      return Right(response.toHomeProductEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
