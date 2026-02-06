import 'package:dio/dio.dart';

class DioClient {
  static Dio getDio({String? token}) {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://flutter-amr.noviindus.in/api/',
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
      ),
    );

    if (token != null) {
      dio.options.headers['Authorization'] = 'Bearer $token';
    }

    return dio;
  }
}
