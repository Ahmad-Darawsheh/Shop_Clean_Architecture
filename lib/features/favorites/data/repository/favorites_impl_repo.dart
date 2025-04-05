import 'package:dartz/dartz.dart';
import 'package:shop_app_clean/core/error/failures.dart';
import 'package:shop_app_clean/features/favorites/data/data_source/favorites_remote_data_source.dart';
import 'package:shop_app_clean/features/favorites/domain/entity/favorite_product_entity.dart';
import 'package:shop_app_clean/features/favorites/domain/repository/favorites_base_repo.dart';

class FavoritesImplRepository extends FavoritesBaseRepository {
  FavoritesRemoteDataSource favoritesRemoteDataSource;
  FavoritesImplRepository(this.favoritesRemoteDataSource);

  @override
  Future<Either<Failure, List<FavoriteProductEntity>>> fetchFavorites() async {
    try {
      final result = await favoritesRemoteDataSource.fetchFavorites();
      
      return Right(result.map((e) => e.toEntity()).toList());
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }
}
