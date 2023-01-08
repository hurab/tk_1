// To parse this JSON data, do
//
//     final productResponse = productResponseFromJson(jsonString);

import 'dart:convert';

ProductResponse? productResponseFromJson(String str) => ProductResponse.fromJson(json.decode(str));

class ProductResponse {
  ProductResponse({
    required this.id,
    required this.name,
    required this.desc,
    required this.regularPrice,
    required this.salePrice,
    required this.onSale,
    required this.stock,
    required this.isFavourite,
    required this.rate,
    required this.numUsersRate,
    required this.images,
    required this.reviews,
    required this.productDetails,
    required this.store,
  });

  final int? id;
  final String? name;
  final String? desc;
  final double? regularPrice;
  final double? salePrice;
  final bool? onSale;
  final int? stock;
  final bool? isFavourite;
  final double? rate;
  final int? numUsersRate;
  final List<ImageItem> images;
  final List<Review> reviews;
  final List<ProductDetail> productDetails;
  final Store? store;

  factory ProductResponse.fromJson(Map<String, dynamic> json) => ProductResponse(
        id: json["id"],
        name: json["name"],
        desc: json["desc"],
        regularPrice: json["regular_price"] == null ? null : json["regular_price"].toDouble(),
        salePrice: json["sale_price"] == null ? null : json["sale_price"].toDouble(),
        onSale: json["on_sale"],
        stock: json["stock"],
        isFavourite: json["is_favourite"],
        rate: json["rate"] == null ? null : json["rate"].toDouble(),
        numUsersRate: json["num_users_rate"],
        images: json["images"] == null ? [] : List<ImageItem>.from(json["images"].map((x) => ImageItem.fromJson(x))),
        reviews: json["reviews"] == null ? [] : List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
        productDetails: json["product_details"] == null ? [] : List<ProductDetail>.from(json["product_details"].map((x) => ProductDetail.fromJson(x))),
        store: Store.fromJson(json["store"]),
      );
}

class ImageItem {
  ImageItem({
    required this.id,
    required this.img,
  });

  final int? id;
  final String? img;

  factory ImageItem.fromJson(Map<String, dynamic> json) => ImageItem(
        id: json["id"],
        img: json["img"],
      );
}

class ProductDetail {
  ProductDetail({
    required this.id,
    required this.value,
    required this.nameAr,
    required this.nameEn,
  });

  final int? id;
  final String? value;
  final String? nameAr;
  final String? nameEn;

  factory ProductDetail.fromJson(Map<String, dynamic> json) => ProductDetail(
        id: json["id"],
        value: json["value"],
        nameAr: json["name_ar"],
        nameEn: json["name_en"],
      );
}

class Review {
  Review({
    required this.userName,
    required this.review,
    required this.rate,
    required this.createdAt,
  });

  final String? userName;
  final String? review;
  final int? rate;
  final String? createdAt;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        userName: json["user_name"],
        review: json["review"],
        rate: json["rate"],
        createdAt: json["created_at"],
      );
}

class Store {
  Store({
    required this.id,
    required this.name,
    required this.logo,
    required this.fullAddress,
  });

  final int? id;
  final String? name;
  final String? logo;
  final String? fullAddress;

  factory Store.fromJson(Map<String, dynamic> json) => Store(
        id: json["id"],
        name: json["name"],
        logo: json["logo"],
        fullAddress: json["full_address"],
      );
}
