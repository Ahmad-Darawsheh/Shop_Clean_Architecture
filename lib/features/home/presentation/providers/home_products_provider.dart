

import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:riverpod/riverpod.dart';
import 'package:shop_app_clean/core/error/failures.dart';
import 'package:shop_app_clean/features/home/domain/entity/product_entity/home_product_entity.dart';
import 'package:shop_app_clean/features/home/domain/usecases/home_products_use_case.dart';

class HomeProductsNotifier extends AsyncNotifier<HomeProductEntity> {
  @override
  Future<HomeProductEntity> build() async {
    final homeProductsUseCase = GetIt.I<HomeProductsUseCase>();
    final result =  await homeProductsUseCase.getHomeProducts();
    
    return result.fold(
      (l) => throw ServerFailure(l.message),
      (r) => r,
    );
  }

 
}
 final homeProductsProvider =
      AsyncNotifierProvider<HomeProductsNotifier, HomeProductEntity>(() {
    return HomeProductsNotifier();
  });
