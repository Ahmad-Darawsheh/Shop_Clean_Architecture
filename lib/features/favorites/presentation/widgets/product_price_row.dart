import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_clean/features/home/presentation/bloc/home_bloc.dart';

class ProductPriceRow extends StatelessWidget {
  final double? price;
  final double? oldPrice;
  final VoidCallback onRemoveFavorite;
  final int productId;

  const ProductPriceRow({
    super.key,
    required this.price,
    this.oldPrice,
    required this.onRemoveFavorite,
    required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeBloc>();
    final bool hasDiscount =
        oldPrice != null && price != null && oldPrice! > price!;

    return Row(
      children: [
        Text(
          '\$${price?.toStringAsFixed(2) ?? '0.00'}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: hasDiscount ? Colors.red : Colors.black87,
          ),
        ),
        const SizedBox(width: 8),
        if (hasDiscount)
          Text(
            '\$${oldPrice!.toStringAsFixed(2)}',
            style: const TextStyle(
              decoration: TextDecoration.lineThrough,
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        const Spacer(),
        BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return IconButton(
              icon: Icon(
                Icons.favorite,
                color: bloc.favoriteItems[productId] ?? false
                    ? Colors.red
                    : Colors.grey,
              ),
              onPressed: onRemoveFavorite,
            );
          },
        ),
      ],
    );
  }
}
