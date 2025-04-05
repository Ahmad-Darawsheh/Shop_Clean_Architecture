import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_clean/features/favorites/domain/entity/favorite_product_entity.dart';
import 'package:shop_app_clean/features/favorites/presentation/widgets/discount_badge.dart';
import 'package:shop_app_clean/features/favorites/presentation/widgets/product_price_row.dart';
import 'package:shop_app_clean/features/home/presentation/bloc/home_bloc.dart';

class FavoriteItemCard extends StatelessWidget {
  final FavoriteProductEntity favorite;

  const FavoriteItemCard({
    super.key,
    required this.favorite,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key('favorite_${favorite.id}'),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20.0),
        color: Colors.red,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      onDismissed: (direction) {
        if (favorite.id != null) {
          context.read<HomeBloc>().add(
                FavoriteItemEvent(favorite.id!),
              );
        }
      },
      confirmDismiss: (direction) async {
        return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Remove from Favorites"),
              content: const Text(
                "Are you sure you want to remove this item from your favorites?",
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text("CANCEL"),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text(
                    "REMOVE",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            );
          },
        );
      },
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.only(bottom: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProductImage(),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildProductName(),
                    const SizedBox(height: 8),
                    if (favorite.description != null) ...[
                      _buildProductDescription(),
                      const SizedBox(height: 8),
                    ],
                    ProductPriceRow(
                      productId: favorite.id!,
                      price: favorite.price,
                      oldPrice: favorite.oldPrice,
                      onRemoveFavorite: () {
                        if (favorite.id != null) {
                          context.read<HomeBloc>().add(
                                FavoriteItemEvent(favorite.id!),
                              );
                        }
                      },
                    ),
                    if (favorite.discount != null && favorite.discount! > 0)
                      DiscountBadge(discount: favorite.discount!),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: favorite.image != null
          ? Image.network(
              favorite.image!,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 100,
                  height: 100,
                  color: Colors.grey[300],
                  child: const Icon(
                    Icons.error_outline,
                    color: Colors.grey,
                  ),
                );
              },
            )
          : Container(
              width: 100,
              height: 100,
              color: Colors.grey[300],
              child: const Icon(Icons.image_not_supported),
            ),
    );
  }

  Widget _buildProductName() {
    return Text(
      favorite.name ?? 'Unknown Product',
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildProductDescription() {
    return Text(
      favorite.description!,
      style: TextStyle(
        color: Colors.grey[600],
        fontSize: 14,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
