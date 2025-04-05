import 'package:dartz/dartz.dart';
import 'package:shop_app_clean/core/error/failures.dart';
import 'package:shop_app_clean/features/favorites/domain/entity/favorite_product_entity.dart';

abstract class FavoritesBaseRepository {

  Future<Either<Failure,List<FavoriteProductEntity>>> fetchFavorites();
    
  
}