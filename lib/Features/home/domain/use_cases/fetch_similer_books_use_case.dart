import 'package:bookly_app/Features/home/domain/entities/book_entitiy.dart';
import 'package:bookly_app/Features/home/domain/repositories/home_repo.dart';
import 'package:bookly_app/core/error/failures.dart';
import 'package:bookly_app/core/use_case/use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
@injectable
class FetchSimilerBooksUseCase extends UseCase<List<BookEntitiy>, SimilarBooksParams> {
  final HomeRepo _homeRepo;

  FetchSimilerBooksUseCase(this._homeRepo);
  @override
  Future<Either<Failure, List<BookEntitiy>>> call([SimilarBooksParams? bookParam])async {
    return await _homeRepo.fetchSimilertBooks(
      pageNumber:bookParam!.pageNumber ,
      categoryId:bookParam.categoryId ,

    );
  }
}
class SimilarBooksParams {
  final String categoryId;
  final int pageNumber;

  SimilarBooksParams({
    required this.categoryId,
    required this.pageNumber,
  });
}
