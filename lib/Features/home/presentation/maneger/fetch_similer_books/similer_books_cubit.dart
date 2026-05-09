import 'package:bookly_app/Features/home/domain/use_cases/fetch_similer_books_use_case.dart';
import 'package:bookly_app/Features/home/presentation/maneger/fetch_similer_books/similer_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SimilerBooksCubit extends Cubit<SimilerBooksState> {
  SimilerBooksCubit(this._similerBooksUseCase) : super(SimilerBooksInitial());
  final FetchSimilerBooksUseCase _similerBooksUseCase;
  Future<void> featchSimilerBooks({
    required String categoryId,
    int pageNumber = 0,
  }) async {
    if (pageNumber == 0) {
      emit(SimilerBooksLoading());
    } else {
      emit(SimilerBooksPaginationLoading());
    }

    var result = await _similerBooksUseCase.call(
      SimilarBooksParams(categoryId: categoryId, pageNumber: pageNumber),
    );
    result.fold(
      (failure) {
        if (pageNumber == 0) {
          emit(SimilerBooksFailure(errorMessage: failure.errMessage));
        } else {
          emit(SimilerBooksPaginationFailure(errorMessage: failure.errMessage));
        }
      },
      (books) {
        emit(SimilerBooksSuccess(books: books));
      },
    );
  }
}
