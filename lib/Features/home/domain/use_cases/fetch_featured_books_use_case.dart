import 'package:bookly_app/Features/home/domain/entities/book_entitiy.dart';
import 'package:bookly_app/Features/home/domain/repositories/home_repo.dart';
import 'package:bookly_app/core/error/failures.dart';
import 'package:bookly_app/core/use_case/use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
@injectable
class FetchFeaturedBooksUseCase extends UseCase<List<BookEntitiy>, NoParam> {
  final HomeRepo _homeRepo;

  FetchFeaturedBooksUseCase(this._homeRepo);
  @override
  Future<Either<Failure,List< BookEntitiy>>> call([NoParam? param]) async {
    return await _homeRepo.fetchFeaturedBooks();
  }
}
