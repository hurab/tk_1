import 'package:flutter/material.dart';

class RateStarsWidget extends StatelessWidget {
  final double rate;
  const RateStarsWidget({required this.rate, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
        (index) => Icon(Icons.star, color: index < rate ? Colors.yellow : Colors.grey, size: 16),
      ),
    );
  }
}
