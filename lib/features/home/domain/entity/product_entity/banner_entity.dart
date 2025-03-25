import 'package:equatable/equatable.dart';
import 'package:shop_app_clean/features/home/domain/entity/product_entity/category_entity.dart';
import 'package:shop_app_clean/features/home/domain/entity/product_entity/product_entity.dart';

class BannerEntity extends Equatable{

  final int id;
  final String image;
  final CategoryEntity? categoryEntity;
  final ProductEntity? productEntity;

  const BannerEntity({required this.id, required this.image, required this.categoryEntity, required this.productEntity});
  @override
  
  List<Object?> get props =>[id, image, categoryEntity, productEntity];

}