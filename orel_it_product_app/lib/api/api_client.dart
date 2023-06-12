import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

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

  getAllProductAPI() async {
    try {
      final options = Options(headers: {
        'Content-Type': 'application/json',
      });
      final response = await _dio.get(
        'https://8c155025-93d6-4ead-a36d-9afdf9c1f291.mock.pstmn.io/recommend/items?page=0',
        options: options,
      );
      return response;
    } on DioException catch (e) {
      return e.response?.statusCode;
    }
  }

  void handleError(dynamic error, BuildContext context) {
    if (error is DioException) {
      final response = error.response;
      if (response?.statusCode == 401) {
        // Handle 401 Unauthorized error
        print('Unauthorized error');
      } else if (response?.statusCode == 403) {
        // Handle 403 Forbidden error
        print('Forbidden error');
      } else if (response?.statusCode == 500) {
        // Handle 500 Internal Server Error
        print('Internal Server Error');
      } else {
        // Handle other errors
        print('Request failed with status: ${response?.statusCode}');
      }
    } else {
      // Handle other types of errors
      print('Error: $error');
    }
  }
}
