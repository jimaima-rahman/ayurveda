import 'package:ayurveda/core/api_constants.dart';
import 'package:dio/dio.dart';

class AuthService {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: baseUrl, headers: {'Accept': 'application/json'}),
  );

  Future<String> login({
    required String username,
    required String password,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        'username': username,
        'password': password,
      });

      final response = await _dio.post(loginEndpoint, data: formData);

      if (response.statusCode == 200) {
        return response.data['token'];
      } else {
        throw Exception('Login failed');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
