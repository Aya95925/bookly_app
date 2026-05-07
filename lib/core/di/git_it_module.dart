import 'package:bookly_app/core/utils/app_constants.dart';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class GitItModule {
 @singleton
Connectivity creatConnectivity() => Connectivity();
  @singleton
  Dio createDio() {
    var dio = Dio(BaseOptions(baseUrl: AppConstant.baseUrl));
    dio.interceptors.add(PrettyDioLogger(requestBody: true));
    return dio;
  }

  @preResolve
  Future<SharedPreferences> get prefs async =>
      await SharedPreferences.getInstance();
}
