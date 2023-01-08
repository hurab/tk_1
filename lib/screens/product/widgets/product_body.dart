import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wothoq/domain/model/product_response.dart';
import 'package:wothoq/screens/product/widgets/bottom_cart_widget.dart';
import 'package:wothoq/screens/product/widgets/product_details_reviews.dart';
import 'package:wothoq/screens/product/widgets/product_price.dart';
import 'package:wothoq/screens/product/widgets/product_rate.dart';
import 'package:wothoq/screens/product/widgets/store_info.dart';

class ProductBody extends StatelessWidget {
  final ProductResponse productResponse;
  const ProductBody(this.productResponse, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        key: Key("product_screen${EasyLocalization.of(context)!.locale.toString()}}"),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: ListView(
          children: [
            //*Header
            Container(
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(productResponse.name ?? "N/A"),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      ProductPrice(oldPrice: productResponse.regularPrice, price: productResponse.salePrice),
                      Spacer(),
                      ProductRate(rate: productResponse.rate ?? 0, rateCount: productResponse.numUsersRate ?? 0),
                    ],
                  ),
                  Divider(color: Colors.grey, thickness: 1, height: 20),
                  if (productResponse.store != null) ProductStoreInfo(store: productResponse.store!),
                ],
              ),
            ),
            SizedBox(height: 16),

            //*Product Description
            Container(
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Text(productResponse.desc ?? "N/A"),
            ),
            SizedBox(height: 16),

            //*Tap Bar(Product details , Reviews)
            Container(
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: ProductDetailsAndReviews(
                productDetails: productResponse.productDetails,
                productReviews: productResponse.reviews,
              ),
            ),
            SizedBox(height: 24),

            //Bottom cart
            BottomCartWidget(),

            SizedBox(height: 32),
          ],
        ));
  }
}
