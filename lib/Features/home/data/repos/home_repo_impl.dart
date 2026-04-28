import 'package:bookly_app/Features/Network/api_maneger.dart';
import 'package:bookly_app/Features/Network/model/response/remote_books/item.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo.dart';
import 'package:bookly_app/core/utils/app_errors.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiManeger _apiManeger;

  HomeRepoImpl(this._apiManeger);
  @override
  Future<Either<Failure, List<Item>>> fetchFeaturedBooks() async {
    return await _apiManeger.fetchFeaturedBooks();
  }

  @override
  Future<Either<Failure, List<Item>>> fetchNewestBooks() async {
    return await _apiManeger.fetchNewestBooks();
  }
}
