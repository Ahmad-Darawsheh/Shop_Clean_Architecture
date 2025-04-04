import 'package:shop_app_clean/features/home/domain/entity/product_entity/category_entity.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel(
      {required super.id, required super.image, required super.name});


      CategoryModel.fromJson(Map<String, dynamic> json)
      : super(
          id: json['id'] as int,
          image: json['image'] as String,
          name: json['name'] as String,
        );
}
