import 'package:flutter/material.dart';
import 'package:shop_app_clean/core/styles/colors.dart';

class FeaturedBanner extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String buttonText;
  final VoidCallback? onButtonPressed;
  final String imagePath;

  const FeaturedBanner({
    super.key,
     this.title,
     this.subtitle,
    this.buttonText = 'Shop Now',
    this.onButtonPressed,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: 300,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            CustomColors.PRIMARY,
            CustomColors.SECONDARY,
          ],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(imagePath),
                    fit: BoxFit.fill,
                  )
                      ,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(
                //   title,
                //   style: const TextStyle(
                //     color: Colors.white,
                //     fontWeight: FontWeight.bold,
                //     fontSize: 22,
                //   ),
                // ),
                // const SizedBox(height: 8),
                // Text(
                //   subtitle,
                //   style: const TextStyle(
                //     color: Colors.white,
                //     fontSize: 16,
                //   ),
                // ),
                
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}
