import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app_clean/features/home/presentation/widgets/home_widgets/category_item_home.dart';
import 'package:shop_app_clean/features/home/presentation/providers/products/home_products_provider.dart';

class CategoriesRow extends StatelessWidget {
  final List<Map<String, dynamic>> categories;
  final Function(int)? onCategoryTap;

  const CategoriesRow({
    super.key,
    required this.categories,
    this.onCategoryTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Consumer(
            builder: (context, ref, child) {
              final homeProductsAsync = ref.watch(homeProductsProvider);
              return homeProductsAsync.when(data: (data) {
                return CategoryItem(
                  // name: category['name'] as String,
                  name: '${homeProductsAsync.value?.banners![index].id}',
                  icon: category['icon'] as IconData,
                  onTap: onCategoryTap != null
                      ? () => onCategoryTap!(index)
                      : null,
                );
              }, error: (error, StackTrace stackTrace) {
                return Text("Error: $error");
              }, loading: () {
                return const Center(child: CircularProgressIndicator());
              });
            },
          );
        },
      ),
    );
  }
}
