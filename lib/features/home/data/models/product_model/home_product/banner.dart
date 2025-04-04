import 'package:shop_app_clean/features/home/data/models/category_model.dart';
import 'package:shop_app_clean/features/home/domain/entity/product_entity/banner_entity.dart';

class BannerModel extends BannerEntity {
  const BannerModel({
    required super.id,
    required super.image,
    required super.categoryEntity,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        id: json['id'] as int,
        image: json['image'] as String,
        categoryEntity: json['category'] != null
            ? CategoryModel.fromJson(json['category'])
            : null,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'image': image,
        'category': categoryEntity,
      };
}
