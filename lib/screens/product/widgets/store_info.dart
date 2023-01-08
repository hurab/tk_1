import 'package:flutter/material.dart';
import 'package:wothoq/core/theme/app_colors.dart';
import 'package:wothoq/domain/model/product_response.dart';

class ProductStoreInfo extends StatelessWidget {
  final Store store;
  const ProductStoreInfo({required this.store, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(store.logo ?? ""),
          
        ),
        SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (store.name != null)
                Text(
                  store.name!,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              Row(
                children: [
                  Icon(Icons.location_on_outlined, size: 16, color: AppColors.primaryColor),
                  if (store.fullAddress != null) ...[
                    SizedBox(width: 4),
                    Expanded(
                        child: Text(
                      store.fullAddress!,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    )),
                  ]
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
