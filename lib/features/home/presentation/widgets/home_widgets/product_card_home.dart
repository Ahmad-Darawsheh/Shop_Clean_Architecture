import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_clean/features/home/presentation/bloc/home_bloc.dart';

class ProductCard extends StatelessWidget {
  final int id;
  final String name;
  final double price;
  final int? discount;
  final bool initialIsFavorite; // Use initialIsFavorite
  final VoidCallback? onAddToCart;
  final String imageUrl;

  const ProductCard({
    super.key,
    required this.id,
    required this.name,
    required this.price,
    this.discount,
    this.initialIsFavorite = false,
    this.onAddToCart,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeBloc>();
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(12)),
                ),
                child: Center(child: Image.network(imageUrl)),
              ),
              if (discount != null && discount! > 0)
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      '-$discount%',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: () {
                    bloc.add(
                        FavoriteItemEvent(id)); // Use initialIsFavorite here
                  },
                  child: BlocBuilder<HomeBloc, HomeState>(
                    // Use BlocBuilder for immediate UI update
                    buildWhen: (previous, current) =>
                        current is FavoriteProductLoadingState ||
                        current is FavoriteProductSuccessState ||
                        current is FavoriteProductFailureState,
                    builder: (context, state) {
                      return Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          bloc.favoriteItems[id]!
                              ? Icons.favorite
                              : Icons.favorite_border,
                          size: 20,
                          color: bloc.favoriteItems[id]!
                              ? Colors.red
                              : Colors.grey,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      '\$${price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    if (discount != null && discount! > 0) ...[
                      const SizedBox(width: 4),
                      Text(
                        '\$${(price * (1 + discount! / 100)).toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 12,
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Row(
                      children: List.generate(
                        5,
                        (index) => Icon(
                          index < 4 ? Icons.star : Icons.star_border,
                          size: 14,
                          color: Colors.amber,
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '4.0',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
