import 'package:bookly_app/Features/Network/model/response/remote_books/item.dart';
import 'package:bookly_app/Features/Network/model/response/remote_books/remote_books.dart';
import 'package:bookly_app/core/api_service.dart';
import 'package:bookly_app/core/utils/app_errors.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract  final class ApiManeger {
  final ApiServer _apiServer;

  ApiManeger(this._apiServer);

 final String endPointNewsetBooks =
      'volumes?Filtering=free-ebooks&q=subject:Programming&Sorting=newest';
 final String endPointFeaturedBooks =
      'volumes?Filtering=free-ebooks&q=subject:Programming';

 Future<Either<Failure, List<Item>>> fetchFeaturedBooks() async {
    try {
      final response = await _apiServer.getBooks(
        endPoint: endPointFeaturedBooks,
      );

      final remoteBooks = RemoteBooks.fromJson(response);

      return right(remoteBooks.items ?? []);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure('Unexpected error occurred'));
    }
  }

  Future<Either<Failure, List<Item>>> fetchNewestBooks() async {
    try {
      final response = await _apiServer.getBooks(
        endPoint: endPointNewsetBooks,
      );

      final remoteBooks = RemoteBooks.fromJson(response);

      return right(remoteBooks.items ?? []);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure('Unexpected error occurred'));
    }
  }
}
