import 'package:bookly_app/Features/Network/api_maneger.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/core/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<ApiServer>(ApiServer(dio: Dio()));

  getIt.registerSingleton<ApiManeger>(
    ApiManeger(getIt.get<ApiServer>()),
  );
  getIt.registerSingleton<HomeRepoImpl>(
   
      HomeRepoImpl(getIt.get<ApiManeger>()),
   
  );
}
