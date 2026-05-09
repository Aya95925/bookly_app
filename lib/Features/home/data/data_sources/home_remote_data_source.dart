import 'package:bookly_app/Features/Network/model/response/remote_books/item.dart';
import 'package:bookly_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRemoteDataSource {
  Future<Either<Failure, List<Item>>> fetchFeaturedBooks({int pageNumber=0});
  Future<Either<Failure, List<Item>>> fetchNewestBooks({int pageNumber=0});
  Future<Either<Failure, List<Item>>> fetchSimilerBooks({String?categoryId,int pageNumber=0});
}
