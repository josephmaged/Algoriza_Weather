import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'https://api.weatherapi.com/v1/',
          connectTimeout: 30 * 1000,
          receiveTimeout: 30 * 1000,
          receiveDataWhenStatusError: true,
          headers: {'Content-Type': 'Application/json', 'Accept': '*/*'}),
    );
  }

  static Future<Response> getForecastData({required String url, Map<String, dynamic>? query}) async {
    Response? res;
    try {
      res = await dio.get(url, queryParameters: query);
      return res;
    } on DioError catch (e) {
      return e.error;
    }
  }
}
