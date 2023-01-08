import 'package:dio/dio.dart';

class ApiConsumer {
  static String _baseURL = "https://run.mocky.io/v3/1243be15-efd5-4132-9bd0-eeb33f325f51";
  static String _contentType = "Content-Type";
  static String _accept = "accept";
  static String _applicationJson = "application/json";

  final BaseOptions baseOptions = BaseOptions(
    baseUrl: _baseURL,
    receiveDataWhenStatusError: true,
    headers: {
      _contentType: _applicationJson,
      _accept: _applicationJson,
    },
  );

  Future<Response> get({required String url, Map<String, dynamic>? queryParameters}) async {
    Dio _dio = Dio(baseOptions);
    return await _dio.get(url, queryParameters: queryParameters);
  }
}
