import 'package:bookly_app/core/utils/app_constants.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
@injectable
class ApiServer {
  final String _baseUrl = AppConstant.baseUrl;
  final Dio dio;

  ApiServer({required this.dio});
  Future<Map<String,dynamic>> getBooks({required String endPoint}) async {
    var response = await dio.get('$_baseUrl$endPoint');
    return response.data;
  }
}