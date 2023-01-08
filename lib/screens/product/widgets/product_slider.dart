import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:wothoq/core/theme/app_colors.dart';
import 'package:wothoq/domain/model/product_response.dart';

class ProductSlider extends StatefulWidget {
  final List<ImageItem> images;
  const ProductSlider(this.images, {super.key});

  @override
  State<ProductSlider> createState() => _ProductSliderState();
}

class _ProductSliderState extends State<ProductSlider> {
  int currentSliderPosition = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.images.isEmpty) return Container();
    List<Widget> items = widget.images.where((im) => im.img != null).toList().map((image) => singleSliderItem(image.img!)).toList();

    return Container(
      child: Stack(
        children: <Widget>[
          CarouselSlider(
            items: items,
            options: CarouselOptions(
              aspectRatio: 1.65,
              viewportFraction: 1.0,
              autoPlayInterval: Duration(seconds: 4),
              autoPlayAnimationDuration: Duration(milliseconds: 650),
              enlargeCenterPage: false,
              disableCenter: false,
              scrollDirection: Axis.horizontal,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: false,
              height: MediaQuery.of(context).size.height / 3.6,
              onPageChanged: (pageNo, reason) {
                currentSliderPosition = pageNo;
                setState(() {});
              },
            ),
          ),
          Positioned(
            bottom: 24,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ...items.map((singleString) {
                  var index = items.indexOf(singleString);
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(80),
                      color: currentSliderPosition == index ? AppColors.primaryColor : Color(0xffE1E1E1),
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget singleSliderItem(String url) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: CachedNetworkImage(
        imageUrl: url,
        errorWidget: (vtx, url, obj) {
          return Stack(
            children: [
              Image.asset(
                "assets/images/honey.jpg",
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              Center(child: Icon(Icons.error, color: Colors.white)),
            ],
          );
        },
        placeholder: (ctx, url) {
          return Center(child: CircularProgressIndicator());
        },
        fit: BoxFit.fill,
      ),
    );
  }
}
