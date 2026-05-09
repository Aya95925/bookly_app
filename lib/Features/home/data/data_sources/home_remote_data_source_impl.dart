import 'package:bookly_app/Features/Network/api_client/api_client.dart';
import 'package:bookly_app/Features/Network/model/response/remote_books/item.dart';
import 'package:bookly_app/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiClient _apiClient;
 

  HomeRemoteDataSourceImpl(this._apiClient);
  @override
  Future<Either<Failure, List<Item>>> fetchFeaturedBooks({int pageNumber=0}) async {
    return await _apiClient.fetchFeaturedBooks(pageNumber: pageNumber);
  }

  @override
  Future<Either<Failure, List<Item>>> fetchNewestBooks({int pageNumber=0}) async {
    return await _apiClient.fetchNewestBooks(pageNumber: pageNumber);
  }
  
  @override
  Future<Either<Failure, List<Item>>> fetchSimilerBooks({String? categoryId,int pageNumber=0}) async{
    return await _apiClient.fetchSimilerBooks(categoryId: categoryId,pageNumber: pageNumber);
  }
}
