import 'package:bookly_app/Features/home/domain/entities/book_entitiy.dart';
import 'package:bookly_app/Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'newest_books_state.dart';

@injectable
class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this._newsetBooksUseCase) : super(NewestBooksInitial());
  final FetchNewestBooksUseCase _newsetBooksUseCase;
  Future<void> featchNewestBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(NewestBooksLoading());
    } else {
      emit(NewestBooksPaginationLoading());
    }

    var result = await _newsetBooksUseCase(pageNumber);
    result.fold(
      (failure) {
        if (pageNumber == 0) {
          emit(NewestBooksFailure(errorMessage: failure.errMessage));
        } else {
          emit(NewestBooksPaginationFailure(errorMessage: failure.errMessage));
        }
      },
      (books) {
        emit(NewestBooksSuccess(books: books));
      },
    );
  }
}
