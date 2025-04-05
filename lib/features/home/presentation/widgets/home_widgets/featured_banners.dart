import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app_clean/features/home/presentation/providers/products/home_products_provider.dart';
import 'package:shop_app_clean/features/home/presentation/widgets/home_widgets/featured_banner_home.dart';

class FeaturedRow extends StatelessWidget {
  final Function(int)? onCategoryTap;

  const FeaturedRow({
    super.key,
    this.onCategoryTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Consumer(
        builder: (context, ref, child) {
          final homeProductsAsync = ref.watch(homeProductsProvider);
          return homeProductsAsync.when(
            data: (data) {
              return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                scrollDirection: Axis.horizontal,
                itemCount: data.banners!.length,
                itemBuilder: (context, index) {
                  return FeaturedBanner(
                    imagePath: data.banners![index].image,
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
        },
      ),
    );
  }
}
