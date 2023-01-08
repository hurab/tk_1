import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wothoq/core/utils/helper.dart';
import 'package:wothoq/domain/model/product_response.dart';

class ProductDetails extends StatelessWidget {
  final List<ProductDetail> productDetails;
  const ProductDetails({required this.productDetails, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        for (int i = 0; i < productDetails.length; i++)
          Container(
            color: i % 2 == 0 ? Colors.blueGrey.shade50 : Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Expanded(child: Text(Helper.getTransulatedValue(productDetails[i].nameAr, productDetails[i].nameEn, context.locale), style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
                Text(productDetails[i].value ?? "", style: TextStyle(fontSize: 14)),
              ],
            ),
          ),
      ]),
    );
  }
}
