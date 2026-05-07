import 'package:bookly_app/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookly_app/Features/home/presentation/maneger/fetch_featured_books/fetch_featured_books_state.dart';
import 'package:bookly_app/core/use_case/use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FetchFeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FetchFeaturedBooksCubit(this._featuredBooksUseCase)
      : super(FeaturedBooksInitial());

  final FetchFeaturedBooksUseCase _featuredBooksUseCase;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());

    final result = await _featuredBooksUseCase(NoParam());

    result.fold(
      (failure) {
        emit(
          FeaturedBooksFailure(
            errorMessage: failure.errMessage,
          ),
        );
      },
      (books) {
        emit(
          FeaturedBooksSuccess(
            books: books,
          ),
        );
      },
    );
  }
}