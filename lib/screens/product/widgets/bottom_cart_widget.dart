import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wothoq/core/theme/app_colors.dart';
import 'package:wothoq/data/product_provider.dart';
import 'package:wothoq/translations/strings.dart';

class BottomCartWidget extends ConsumerWidget {
  const BottomCartWidget({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
   final counterCount =  ref.watch(counterCart);
    double width = MediaQuery.of(context).size.width;
    double paddingCard = 3;
    double height = 50;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        children: [
          //background
          Container(
            height: height,
            margin: EdgeInsets.symmetric(vertical: paddingCard),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(64),
            ),
          ),

          //Add and remove buttons
          Positioned(
            left: 0,
            right: width / 2.1,
            top: 0,
            bottom: 0,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      ref.read(counterCart.notifier).state++;
                    },
                    icon: Icon(
                      Icons.add_circle,
                      color: Colors.white,
                      size: 36,
                    ),
                  ),
                  Spacer(),
                  Text("${counterCount}", style: TextStyle(color: Colors.white, fontSize: 18)),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      if(ref.read(counterCart.notifier).state > 1)
                      ref.read(counterCart.notifier).state--;
                    },
                    icon: Icon(
                      Icons.remove_circle,
                      color: Colors.white,
                      size: 36,
                    ),
                  ),
                ],
              ),
            ),
          ),

          //Add to cart button
          Positioned(
            left: width / 2.2,
            right: 0,
            top: 0,
            bottom: 0,
            child: Stack(
              children: [
                Container(
                    width: double.infinity,
                    height: double.infinity,
                    margin: EdgeInsets.only(left: 40),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(64),
                        bottomRight: Radius.circular(64),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        Strings().addToCart,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    )),
                ClipPath(
                  clipper: BottomCartClipper(
                    width: height,
                    height: height + paddingCard * 2,
                  ),
                  child: Container(
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BottomCartClipper extends CustomClipper<Path> {
  final double width;
  final double height;
  BottomCartClipper({required this.width, required this.height});
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(40, 0.0)
      ..lineTo(width, 0)
      ..lineTo(width, height)
      ..lineTo(0, height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
