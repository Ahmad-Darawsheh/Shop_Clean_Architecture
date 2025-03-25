import 'package:equatable/equatable.dart';
import 'package:shop_app_clean/features/home/domain/entity/product_entity/banner_entity.dart';
import 'package:shop_app_clean/features/home/domain/entity/product_entity/product_entity.dart';

class HomeProductEntity extends Equatable {
  final List<BannerEntity>? banners;
  final List<ProductEntity>? products;
  final String? ad;

  const HomeProductEntity({this.banners, this.products, this.ad});

  @override
  List<Object?> get props => [banners, products, ad];
}
