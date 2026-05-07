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
  Future<void> featchNewestBooks() async {
    emit(NewestBooksLoading());
    var result = await _newsetBooksUseCase.call();
    result.fold(
      (failure) {
        emit(NewestBooksFailure(errorMessage: failure.errMessage));
      },
      (books) {
        emit(NewestBooksSuccess(books: books));
      },
    );
  }
}
