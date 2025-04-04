import 'package:shop_app_clean/features/home/domain/entity/product_entity/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.id,
    required super.price,
    required super.oldPrice,
    required super.discount,
    required super.image,
    required super.name,
    required super.description,
    required super.images,
    required super.inFavorites,
    required super.inCart,
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'] as int? ?? 0,
        price: (json['price'] as num?)?.toDouble() ?? 0.0,
        oldPrice: (json['old_price'] as num?)?.toDouble() ?? 0.0,
        discount: json['discount'] as int? ?? 0,
        image: json['image'] as String? ?? "",
        name: json['name'] as String? ?? "",
        description: json['description'] as String? ?? "",
        images: json['images'] ?? [],
        inFavorites: json['in_favorites'] as bool? ?? false,
        inCart: json['in_cart'] as bool? ?? false,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'price': price,
        'old_price': oldPrice,
        'discount': discount,
        'image': image,
        'name': name,
        'description': description,
        'images': images,
        'in_favorites': inFavorites,
        'in_cart': inCart,
      };
}
