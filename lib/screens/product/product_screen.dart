import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wothoq/data/product_provider.dart';
import 'package:wothoq/screens/product/widgets/product_app_bar.dart';
import 'package:wothoq/screens/product/widgets/product_body.dart';
import 'package:wothoq/screens/product/widgets/product_slider.dart';

class ProductScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(productsProvider);

    return SafeArea(
      child: Scaffold(
        body: data.when(
          loading: () => Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(child: Text(error.toString())),
          data: (data) {
            return Stack(
              children: [
                Container(),
                Container(height: MediaQuery.of(context).size.height / 4, child: ProductSlider(data.images)),
                ProductAppBar(),
                Positioned(
                  top: MediaQuery.of(context).size.height / 4 - 20,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: ProductBody(data),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
