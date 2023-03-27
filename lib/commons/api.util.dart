import 'package:dio/dio.dart';
import 'package:school_management/commons/api_endpoint.dart';

class Api {
  static final dio = Dio();

  static Future<Response> post(String endpoint, {Map<String, dynamic>? headers, Map<String, dynamic>? data}) async {
    try {
      final response = await dio.post(
        APIEndPoints.BASE_URL+endpoint,
        data: data,
        options: Options(
          headers: headers,
        ),
      );
      return response;
    } catch (e) {
      print('Failed to post to $endpoint: ${e.toString()}');
      throw Exception('Failed to post to $endpoint: ${e.toString()}');
    }
  }
}