import 'package:flutter/material.dart';
import 'package:shop_app_clean/features/home/presentation/widgets/home_widgets/featured_banners.dart';
import 'package:shop_app_clean/features/home/presentation/widgets/home_widgets/products_grid_home.dart';
import 'package:shop_app_clean/features/home/presentation/widgets/home_widgets/search_bar_home.dart';
import 'package:shop_app_clean/features/home/presentation/widgets/home_widgets/section_title_home.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search bar
          CustomSearchBar(
            onTap: () {},
            onFilterTap: () {},
          ),

          FeaturedRow(),

        
          SectionTitle(
            title: 'Popular Products',
            onViewAllPressed: () {
             
            },
          ),
          ProductsGrid(
            onProductTap: (id) {
              print('Tapped product id: $id');
            },
            onFavoriteToggle: (id) {
              print('Toggle favorite for product id: $id');
            },
            onAddToCart: (id) {
              print('Add to cart product id: $id');
            },
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
