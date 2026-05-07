import 'package:bookly_app/Features/Network/api_client/api_client.dart';
import 'package:bookly_app/Features/Network/model/response/remote_books/item.dart';
import 'package:bookly_app/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly_app/core/cashe/shared_pref_utils.dart';
import 'package:bookly_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiClient _apiClient;
  final SharedPrefUtils _sharedPrefUtils;

  HomeRemoteDataSourceImpl(this._apiClient,this._sharedPrefUtils);
  @override
  Future<Either<Failure, List<Item>>> fetchFeaturedBooks() async {
    return await _apiClient.fetchFeaturedBooks();
  }

  @override
  Future<Either<Failure, List<Item>>> fetchNewestBooks() async {
    return await _apiClient.fetchNewestBooks();
  }
}
