import 'package:dartz/dartz.dart';
import 'package:shop_app_clean/core/error/failures.dart';
import 'package:shop_app_clean/features/home/domain/entity/product_entity/home_product_entity.dart';
import 'package:shop_app_clean/features/home/domain/repository/home_repository.dart';

class HomeUseCases {
  // This class will contain the use case for fetching home products
  // It will interact with the repository to get the data
  // and return the result to the presentation layer

  HomeRepository homeRepository;
  HomeUseCases({required this.homeRepository});

  Future<Either<Failure, HomeProductEntity>> getHomeProducts() async {
    return await homeRepository.getHomeProducts();
  }

  Future<void> setProductToFavorite(int productId) async {
    await homeRepository.setProductToFavorite(productId);
  }
}
