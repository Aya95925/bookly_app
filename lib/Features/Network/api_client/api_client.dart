

import 'dart:developer';

import 'package:bookly_app/Features/Network/model/response/remote_books/item.dart';
import 'package:bookly_app/Features/Network/model/response/remote_books/remote_books.dart';
import 'package:bookly_app/core/error/failures.dart';
import 'package:bookly_app/core/utils/api_server.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
@injectable
class ApiClient {
  final ApiServer apiServer;
  final String endPointNewsetBooks =
      'volumes?Filtering=free-ebooks&q=subject:Programming&Sorting=newest';
  final String endPointFeaturedBooks =
      'volumes?Filtering=free-ebooks&q=subject:Programming';

  ApiClient(this.apiServer);
  Future<Either<Failure, List<Item>>> fetchFeaturedBooks() async {
    try {
      var response = await apiServer.getBooks(endPoint: endPointFeaturedBooks);
      final remoteBooks = RemoteBooks.fromJson(response);
      return right(remoteBooks.items ?? []);
    } on DioException catch (e) {
        return left(ServerFailure.fromDioException(e));
    } catch (e, stackTrace) {
      log('Error: $e', stackTrace: stackTrace);
      return left(ServerFailure(e.toString()));
    }
    }
     Future<Either<Failure, List<Item>>> fetchNewestBooks() async {
    try {
      var response = await apiServer.getBooks(endPoint: endPointNewsetBooks);
      final remoteBooks = RemoteBooks.fromJson(response);
      return right(remoteBooks.items ?? []);
    } on DioException catch (e) {
        return left(ServerFailure.fromDioException(e));
    } catch (e, stackTrace) {
     log('Error: $e', stackTrace: stackTrace);
      return left(ServerFailure(e.toString()));
    }
    }
    Future<Either<Failure, List<Item>>> fetchSimilerBooks({required String ?categoryId }) async {
    try {
      var response = await apiServer.getBooks(endPoint:'volumes?Filtering=free-ebooks&q=$categoryId&Sorting=relevance');
      final remoteBooks = RemoteBooks.fromJson(response);
      return right(remoteBooks.items ?? []);
    } on DioException catch (e) {
        return left(ServerFailure.fromDioException(e));
    } catch (e, stackTrace) {
     log('Error: $e', stackTrace: stackTrace);
      return left(ServerFailure(e.toString()));
    }
    }
  }

