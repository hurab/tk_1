import 'package:flutter/material.dart';
import 'package:wothoq/screens/widgets/rate_starts.dart';

class ProductRate extends StatelessWidget {
  final double rate;
  final int rateCount;
  const ProductRate({required this.rate, required this.rateCount, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RateStarsWidget(rate: rate),
        SizedBox(width: 8),
        Text('(${rateCount.toString()})'),
      ],
    );
  }
}
