import 'package:flutter/material.dart';
import 'package:wothoq/domain/model/product_response.dart';
import 'package:wothoq/screens/widgets/rate_starts.dart';
import 'package:wothoq/translations/Strings.dart';

class ProductReviews extends StatelessWidget {
  final List<Review> productReviews;
  const ProductReviews({required this.productReviews, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      for (int i = 0; i < productReviews.length; i++)
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      productReviews[i].userName ?? "",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  RateStarsWidget(
                    rate: productReviews[i].rate == null ? 5 : productReviews[i].rate!.toDouble(),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Text(productReviews[i].review ?? Strings().noDescription, style: TextStyle(fontSize: 14)),
              if (productReviews[i].createdAt != null)
                Container(
                  width: double.infinity,
                  child: Text(
                    productReviews[i].createdAt ?? "",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                    textAlign: TextAlign.end,
                  ),
                ),
              Divider(height: 24, color: Colors.grey, thickness: 1),
            ],
          ),
        ),
    ]);
  }
}
