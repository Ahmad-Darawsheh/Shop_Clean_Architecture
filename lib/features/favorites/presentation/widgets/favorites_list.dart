import 'package:flutter/material.dart';
import 'package:shop_app_clean/features/favorites/domain/entity/favorite_product_entity.dart';
import 'package:shop_app_clean/features/favorites/presentation/widgets/favorites_item_card.dart';

class FavoritesList extends StatelessWidget {
  final List<FavoriteProductEntity> favorites;

  const FavoritesList({
    super.key,
    required this.favorites,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: favorites.length,
      itemBuilder: (context, index) {
        return FavoriteItemCard(favorite: favorites[index]);
      },
    );
  }
}