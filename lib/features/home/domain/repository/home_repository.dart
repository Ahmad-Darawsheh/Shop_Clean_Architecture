import 'package:dartz/dartz.dart';
import 'package:shop_app_clean/core/error/failures.dart';
import 'package:shop_app_clean/features/home/domain/entity/product_entity/home_product_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, HomeProductEntity>> getHomeProducts();
}
