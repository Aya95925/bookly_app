import 'package:bookly_app/Features/home/data/data_sources/home_local_data_source.dart';
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
  final HomeLocalDataSource _localDataSource;

  HomeRepoImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Either<Failure, List<BookEntitiy>>> fetchFeaturedBooks() async {
    var result = await _remoteDataSource.fetchFeaturedBooks();

    return await result.fold(
      (failure) async {
        final cachedBooks =
            await _localDataSource.getCachedFeaturedBooks();

        if (cachedBooks.isNotEmpty) {
          final books = cachedBooks
              .map((book) => book.bookEntitiy())
              .toList();

          return Right(books);
        } else {
          return Left(failure);
        }
      },
      (items) async {
        await _localDataSource.cacheFeaturedBooks(items);

        final books = items
            .map((item) => item.bookEntitiy())
            .toList();

        return Right(books);
      },
    );
  }

  @override
  Future<Either<Failure, List<BookEntitiy>>> fetchNewestBooks() async {
    var result = await _remoteDataSource.fetchNewestBooks();

    return await result.fold(
      (failure) async {
        final cachedBooks =
            await _localDataSource.getCachedNewestBooks();

        if (cachedBooks.isNotEmpty) {
          final books = cachedBooks
              .map((book) => book.bookEntitiy())
              .toList();

          return Right(books);
        } else {
          return Left(failure);
        }
      },
      (items) async {
        await _localDataSource.cacheNewestBooks(items);

        final books = items
            .map((item) => item.bookEntitiy())
            .toList();

        return Right(books);
      },
    );
  }
}