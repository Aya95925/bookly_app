import 'package:bookly_app/Features/home/domain/entities/book_entitiy.dart';
import 'package:bookly_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure,List<BookEntitiy>>> fetchFeaturedBooks();
  Future<Either<Failure,List<BookEntitiy>>> fetchNewestBooks();

}