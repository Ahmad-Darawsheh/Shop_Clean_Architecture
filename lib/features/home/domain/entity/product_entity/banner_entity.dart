import 'package:equatable/equatable.dart';
import 'package:shop_app_clean/features/home/domain/entity/product_entity/category_entity.dart';


class BannerEntity extends Equatable {
  final int id;
  final String image;
  final CategoryEntity? categoryEntity;

  const BannerEntity({
    required this.id,
    required this.image,
    required this.categoryEntity,
  });
  @override
  List<Object?> get props => [
        id,
        image,
        categoryEntity,
      ];
}
