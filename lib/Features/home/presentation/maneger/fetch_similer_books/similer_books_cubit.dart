
import 'package:bookly_app/Features/home/domain/use_cases/fetch_similer_books_use_case.dart';
import 'package:bookly_app/Features/home/presentation/maneger/fetch_similer_books/similer_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class SimilerBooksCubit extends Cubit<SimilerBooksState> {
  SimilerBooksCubit(this._similerBooksUseCase): super(SimilerBooksInitial());
  final FetchSimilerBooksUseCase _similerBooksUseCase;
  Future<void> featchSimilerBooks({required String categoryId}) async {
    emit(SimilerBooksLoading());
    var result = await _similerBooksUseCase.call(categoryId);
    result.fold(
      (failure) {
        emit(SimilerBooksFailure(errorMessage: failure.errMessage));
      },
      (books) {
        emit(SimilerBooksSuccess(books: books));
      },
    );
  }
}
