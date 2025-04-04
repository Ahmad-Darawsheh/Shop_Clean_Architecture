import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app_clean/features/home/presentation/providers/home_products_provider.dart';
import 'package:shop_app_clean/features/home/presentation/widgets/home_widgets/product_card_home.dart';

class ProductsGrid extends StatelessWidget {
  final Function(int)? onProductTap;
  final Function(int)? onFavoriteToggle;
  final Function(int)? onAddToCart;

  const ProductsGrid({
    super.key,
    this.onProductTap,
    this.onFavoriteToggle,
    this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final homeProductsAsync = ref.watch(homeProductsProvider);
      return homeProductsAsync.when(
        data: (data) {
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
            itemCount: data.products!.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                // onTap: onProductTap != null
                //     ? () => onProductTap!(product['id'] as int)
                //     : null,
                child: ProductCard(
                  imageUrl: data.products![index].image ?? "None",
                  id: data.products![index].id!,
                  name: data.products![index].name ?? "None",
                  price: data.products![index].price ?? 0.0,
                  discount: data.products![index].discount,
                  isFavorite: data.products![index].inFavorites ?? false,
                  // onFavoriteToggle: onFavoriteToggle != null
                  //     ? () => onFavoriteToggle!(product['id'] as int)
                  //     : null,
                  // onAddToCart: onAddToCart != null
                  //     ? () => onAddToCart!(product['id'] as int)
                  //     : null,
                ),
              );
            },
          );
        },
        error: (error, stackTrace) {
          return Text("Error: $error");
        },
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },
      );
    }
        // child: GridView.builder(
        //   padding: const EdgeInsets.symmetric(horizontal: 16),
        //   shrinkWrap: true,
        //   physics: const NeverScrollableScrollPhysics(),
        //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount: 2,
        //     childAspectRatio: 0.7,
        //     mainAxisSpacing: 16,
        //     crossAxisSpacing: 16,
        //   ),
        //   itemCount: products.length,
        //   itemBuilder: (context, index) {
        //     final product = products[index];
        //     return GestureDetector(
        //       onTap: onProductTap != null
        //           ? () => onProductTap!(product['id'] as int)
        //           : null,
        //       child: ProductCard(
        //         id: product['id'] as int,
        //         name: product['name'] as String,
        //         price: product['price'] as double,
        //         discount: product['discount'] as int?,
        //         isFavorite: product['isFavorite'] as bool? ?? false,
        //         onFavoriteToggle: onFavoriteToggle != null
        //             ? () => onFavoriteToggle!(product['id'] as int)
        //             : null,
        //         onAddToCart: onAddToCart != null
        //             ? () => onAddToCart!(product['id'] as int)
        //             : null,
        //       ),
        //     );
        //   },
        // ),
        );
  }
}
