import 'package:shop_app_clean/features/favorites/domain/entity/favorite_product_entity.dart';

class FavoriteProductsModel extends FavoriteProductEntity {
  const FavoriteProductsModel(
      {required super.id,
      required super.price,
      required super.oldPrice,
      required super.discount,
      required super.image,
      required super.name,
      required super.description});

  factory FavoriteProductsModel.fromJson(Map<String, dynamic> json) {
    return FavoriteProductsModel(
      id: json['id'] ?? '0',
      price: json['price'].toDouble() ?? 0.0,
      oldPrice: json['old_price'].toDouble() ?? 0.0,
      discount: json['discount'] ?? 0,
      image: json['image'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
    );
  }

  FavoriteProductEntity toEntity() {
    return FavoriteProductEntity(
      id: id,
      price: price,
      oldPrice: oldPrice,
      discount: discount,
      image: image,
      name: name,
      description: description,
    );
  }
}
