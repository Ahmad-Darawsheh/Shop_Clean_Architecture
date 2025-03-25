import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final VoidCallback? onViewAllPressed;
  final bool showViewAll;

  const SectionTitle({
    super.key,
    required this.title,
    this.onViewAllPressed,
    this.showViewAll = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (showViewAll)
            TextButton(
              onPressed: onViewAllPressed,
              child: const Text('View All'),
            ),
        ],
      ),
    );
  }
}
