import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app_clean/features/home/domain/entity/product_entity/home_product_entity.dart';
import 'package:shop_app_clean/features/home/presentation/providers/products/home_products_notifier.dart';

final homeProductsProvider =
    AsyncNotifierProvider<HomeProductsNotifier, HomeProductEntity>(() {
  return HomeProductsNotifier();
});
