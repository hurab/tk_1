import 'package:riverpod/riverpod.dart';
import 'package:wothoq/domain/model/product_response.dart';
import 'package:wothoq/domain/repository/product_repo.dart';

final productsProvider = FutureProvider<ProductResponse>((ref) async {
  try {
    ProductResponse response = await ProductRepository().getProducts();
    ref.read(productsResponse.notifier).state = response;
    return response;
  } catch (e) {
    return Future.error(e);
  }
});

final counterCart = StateProvider((ref) => 1);

final productsResponse = StateProvider<ProductResponse?>((ref) => null);
