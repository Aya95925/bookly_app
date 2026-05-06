import 'package:bookly_app/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly_app/Features/home/data/mapper/book_mapper.dart';
import 'package:bookly_app/Features/home/domain/entities/book_entitiy.dart';
import 'package:bookly_app/Features/home/domain/repositories/home_repo.dart';
import 'package:bookly_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource _remoteDataSource;

  HomeRepoImpl(this._remoteDataSource);
  @override
  Future<Either<Failure, List<BookEntitiy>>> fetchFeaturedBooks() async {
    var result = await _remoteDataSource.fetchFeaturedBooks();
    return result.fold((failuer) => Left(failuer), (items) {
      final books = items.map((item) => item.bookEntitiy()).toList();
      return Right(books);
    });
  }

  @override
  Future<Either<Failure, List<BookEntitiy>>> fetchNewestBooks() async {
    var result = await _remoteDataSource.fetchNewestBooks();
    return result.fold((failuer) => Left(failuer), (items) {
      final books = items.map((item) => item.bookEntitiy()).toList();
      return Right(books);
    });
  }
}
