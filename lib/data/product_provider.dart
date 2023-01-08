import 'package:riverpod/riverpod.dart';
import 'package:wothoq/domain/model/product_response.dart';
import 'package:wothoq/domain/repository/product_repo.dart';

final productsProvider = FutureProvider<ProductResponse>((ref) async {
  try {
    return await ProductRepository().getProducts();
  } catch (e) {
    return Future.error(e);
  }
});

final counterCart = StateProvider((ref) => 1);
