import 'package:wothoq/domain/dio_client.dart';
import 'package:wothoq/domain/model/product_response.dart';

class ProductRepository {
  Future<ProductResponse> getProducts() async {
    ApiConsumer _productApi = ApiConsumer();
    try {
      final response = await _productApi.get(url: "");
      return ProductResponse.fromJson(response.data);
    } catch (e) {
      return Future.error(e);
    }
  }
}
