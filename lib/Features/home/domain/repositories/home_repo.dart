import 'package:bookly_app/Features/home/domain/entities/book_entitiy.dart';
import 'package:bookly_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure,List<BookEntitiy>>> fetchFeaturedBooks({int pageNumber=0});
  Future<Either<Failure,List<BookEntitiy>>> fetchNewestBooks({int pageNumber=0});
  Future<Either<Failure,List<BookEntitiy>>> fetchSimilertBooks({String categoryId,int pageNumber=0});

}