import 'package:flutter/material.dart';
import 'package:shop_app_clean/features/home/presentation/widgets/home_widgets/product_card_home.dart';

class ProductsGrid extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final Function(int)? onProductTap;
  final Function(int)? onFavoriteToggle;
  final Function(int)? onAddToCart;

  const ProductsGrid({
    super.key,
    required this.products,
    this.onProductTap,
    this.onFavoriteToggle,
    this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return GestureDetector(
          onTap: onProductTap != null
              ? () => onProductTap!(product['id'] as int)
              : null,
          child: ProductCard(
            id: product['id'] as int,
            name: product['name'] as String,
            price: product['price'] as double,
            discount: product['discount'] as int?,
            isFavorite: product['isFavorite'] as bool? ?? false,
            onFavoriteToggle: onFavoriteToggle != null
                ? () => onFavoriteToggle!(product['id'] as int)
                : null,
            onAddToCart: onAddToCart != null
                ? () => onAddToCart!(product['id'] as int)
                : null,
          ),
        );
      },
    );
  }
}
