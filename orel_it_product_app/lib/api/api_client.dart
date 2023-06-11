import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio = Dio();
  loginAPI({required String email, required String password}) async {
    try {
      final options = Options(headers: {
        'Content-Type': 'application/json',
      });
      Response response = await _dio.post(
        'https://api.escuelajs.co/api/v1/auth/login',
        data: {"email": email, "password": password},
        options: options,
      );
      return response.data;
    } on DioException catch (e) {
      return e.response!.data;
    }
  }
}
