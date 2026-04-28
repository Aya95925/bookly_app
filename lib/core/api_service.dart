import 'package:dio/dio.dart';

class ApiServer {
  final String _baseUrl = 'https://www.googleapis.com/books/v1/';
  final Dio dio;

  ApiServer({required this.dio});
  Future<Map<String,dynamic>> getBooks({required String endPoint}) async {
    var response = await dio.get('$_baseUrl$endPoint');
    return response.data;
  }
}
