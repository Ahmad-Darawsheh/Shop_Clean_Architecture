import 'package:flutter/material.dart';
import 'package:shop_app_clean/features/home/presentation/widgets/home_widgets/categories_row_home.dart';
import 'package:shop_app_clean/features/home/presentation/widgets/home_widgets/featured_banner_home.dart';
import 'package:shop_app_clean/features/home/presentation/widgets/home_widgets/products_grid_home.dart';
import 'package:shop_app_clean/features/home/presentation/widgets/home_widgets/search_bar_home.dart';
import 'package:shop_app_clean/features/home/presentation/widgets/home_widgets/section_title_home.dart';

class HomePageBody extends StatelessWidget {
  // For proper clean architecture, these should come from a viewmodel or bloc
  final List<Map<String, dynamic>> categories = [
    {'name': 'Electronics', 'icon': Icons.devices},
    {'name': 'Fashion', 'icon': Icons.checkroom},
    {'name': 'Home', 'icon': Icons.chair},
    {'name': 'Beauty', 'icon': Icons.face},
    {'name': 'Sports', 'icon': Icons.sports_soccer},
  ];

  final List<Map<String, dynamic>> newArrivals = List.generate(
    4,
    (index) => {
      'id': index,
      'name': 'New Product ${index + 1}',
      'price': 29.99 + index * 10,
      'discount': index % 2 == 0 ? 15 : null,
      'isFavorite': false,
    },
  );

  final List<Map<String, dynamic>> popularProducts = List.generate(
    4,
    (index) => {
      'id': index + 4,
      'name': 'Popular Item ${index + 1}',
      'price': 19.99 + index * 5,
      'discount': index % 2 == 0 ? 15 : null,
      'isFavorite': index == 1,
    },
  );

  HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search bar
          CustomSearchBar(
            onTap: () {
              // Navigate to search page
            },
            onFilterTap: () {
              // Show filter dialog
            },
          ),

          // Featured banner
          FeaturedBanner(
            title: 'Summer Collection',
            subtitle: 'Up to 50% off',
            onButtonPressed: () {
              // Navigate to collection page
            },
            imagePath: 'assets/images/pattern.png',
          ),

          // Categories section
          SectionTitle(
            title: 'Categories',
            onViewAllPressed: () {
              // Navigate to all categories
            },
          ),
          CategoriesRow(
            categories: categories,
            onCategoryTap: (index) {
              // Navigate to category detail
              print('Tapped category: ${categories[index]['name']}');
            },
          ),

          // New arrivals section
          SectionTitle(
            title: 'New Arrivals',
            onViewAllPressed: () {
              // Navigate to all new arrivals
            },
          ),
          ProductsGrid(
            products: newArrivals,
            onProductTap: (id) {
              // Navigate to product detail
              print('Tapped product id: $id');
            },
            onFavoriteToggle: (id) {
              // Toggle favorite status
              print('Toggle favorite for product id: $id');
            },
            onAddToCart: (id) {
              // Add to cart
              print('Add to cart product id: $id');
            },
          ),

          // Popular products section
          SectionTitle(
            title: 'Popular Products',
            onViewAllPressed: () {
              // Navigate to all popular products
            },
          ),
          ProductsGrid(
            products: popularProducts,
            onProductTap: (id) {
              // Navigate to product detail
              print('Tapped product id: $id');
            },
            onFavoriteToggle: (id) {
              // Toggle favorite status
              print('Toggle favorite for product id: $id');
            },
            onAddToCart: (id) {
              // Add to cart
              print('Add to cart product id: $id');
            },
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
