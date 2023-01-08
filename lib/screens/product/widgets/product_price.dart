import 'package:flutter/material.dart';
import 'package:wothoq/core/theme/app_colors.dart';
import 'package:wothoq/translations/Strings.dart';

class ProductPrice extends StatelessWidget {
  final double? price;
  final double? oldPrice;
  const ProductPrice({required this.price, required this.oldPrice, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (price != null) Text(price.toString() + ' ${Strings().currency}', style: TextStyle(fontSize: 14)),
        if (oldPrice != null) ...[
          SizedBox(width: 8),
          Text(
            oldPrice.toString(),
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
              decoration: TextDecoration.lineThrough,
            ),
          ),
          //percentage
          SizedBox(width: 8),
          Text(
            ((oldPrice! - price!) / oldPrice! * 100).toStringAsFixed(0) + '%',
            style: TextStyle(
              fontSize: 12,
              color: AppColors.primaryColor,
            ),
          ),
        ]
      ],
    );
  }
}
