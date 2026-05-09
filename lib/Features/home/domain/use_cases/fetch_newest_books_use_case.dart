import 'package:bookly_app/Features/home/domain/entities/book_entitiy.dart';
import 'package:bookly_app/Features/home/domain/repositories/home_repo.dart';
import 'package:bookly_app/core/error/failures.dart';
import 'package:bookly_app/core/use_case/use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
@injectable
class FetchNewestBooksUseCase extends UseCase<List<BookEntitiy>, int> {
  final HomeRepo _homeRepo;

  FetchNewestBooksUseCase(this._homeRepo);
  @override
  Future<Either<Failure, List<BookEntitiy>>> call([int? param]) async {
    return await _homeRepo.fetchNewestBooks(
      pageNumber: param!
    );
  }
}
