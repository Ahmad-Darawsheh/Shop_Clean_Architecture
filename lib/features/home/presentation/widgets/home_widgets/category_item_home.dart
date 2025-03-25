import 'package:flutter/material.dart';
import 'package:shop_app_clean/core/styles/colors.dart';

class CategoryItem extends StatelessWidget {
  final String name;
  final IconData icon;
  final VoidCallback? onTap;

  const CategoryItem({
    super.key,
    required this.name,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: CustomColors.BACKGROUND,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: CustomColors.PRIMARY,
                size: 24,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              name,
              style: const TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
