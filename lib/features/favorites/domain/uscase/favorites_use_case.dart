import 'package:dartz/dartz.dart';
import 'package:shop_app_clean/core/error/failures.dart';
import 'package:shop_app_clean/features/favorites/domain/entity/favorite_product_entity.dart';
import 'package:shop_app_clean/features/favorites/domain/repository/favorites_base_repo.dart';

class FavoritesUseCase {
  final FavoritesBaseRepository favoritesRepository;

  FavoritesUseCase({required this.favoritesRepository});

  Future<Either<Failure, List<FavoriteProductEntity>>> getFavorites() async {
    return await favoritesRepository.fetchFavorites();
  }
}
