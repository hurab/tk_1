import 'package:wothoq/screens/product/product_screen.dart';

import 'app_pages.dart';

class Routes {
  static const String productScreen = "/";

  static final routes = [
    AppPage(path: Routes.productScreen, page: ProductScreen()),
  ];
}
