import 'package:shop_app_clean/features/home/data/models/product_model/home_product/banner.dart';
import 'package:shop_app_clean/features/home/data/models/product_model/home_product/product.dart';
import 'package:shop_app_clean/features/home/domain/entity/product_entity/home_product_entity.dart';

class HomeProductModel extends HomeProductEntity {
  const HomeProductModel({
    required super.banners,
    required super.products,
    required super.ad,
  });
  factory HomeProductModel.fromJson(Map<String, dynamic> json) {
    return HomeProductModel(
      banners: json['banners'] == null
          ? []
          : List<BannerModel>.from(
              (json['banners'] as List).map((e) => BannerModel.fromJson(e))),
      products: json['products'] == null
          ? []
          : List<ProductModel>.from(
              (json['products'] as List).map((e) => ProductModel.fromJson(e))),
      ad: json['ad'] ?? "",
    );
  }

  toHomeProductEntity() {
    return HomeProductEntity(ad: ad, banners: banners, products: products);
  }
}
