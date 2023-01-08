import 'package:flutter/material.dart';
import 'package:wothoq/core/theme/app_colors.dart';
import 'package:wothoq/domain/model/product_response.dart';
import 'package:wothoq/screens/product/widgets/product_details.dart';
import 'package:wothoq/screens/product/widgets/product_review.dart';
import 'package:wothoq/translations/Strings.dart';

class ProductDetailsAndReviews extends StatefulWidget {
  final List<ProductDetail> productDetails;
  final List<Review> productReviews;
  const ProductDetailsAndReviews({required this.productDetails, required this.productReviews, super.key});
  @override
  State<ProductDetailsAndReviews> createState() => _ProductDetailsAndReviewsState();
}

class _ProductDetailsAndReviewsState extends State<ProductDetailsAndReviews> {
  int tabIndex = 0;
  @override
  Widget build(BuildContext context) {

    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        DefaultTabController(
          length: 2,
          child: TabBar(
            indicatorColor: AppColors.primaryColor,
            labelColor: AppColors.primaryColor,
            unselectedLabelColor: Colors.black,
            onTap: (value) {
              tabIndex = value;
              setState(() {});
            },
            tabs: [
              Tab(text: Strings().productDetails),
              Tab(text: Strings().productReviews),
            ],
          ),
        ),
        if (tabIndex == 0) 
        ProductDetails(productDetails: widget.productDetails) 
        else ProductReviews(productReviews: widget.productReviews)
      ],
    );
  }
}
