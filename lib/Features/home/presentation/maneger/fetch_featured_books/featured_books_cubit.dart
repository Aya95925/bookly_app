

import 'package:bookly_app/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookly_app/Features/home/presentation/maneger/fetch_featured_books/featured_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this._featuredBooksUseCase)
    : super(FeaturedBooksInitial());

  final FetchFeaturedBooksUseCase _featuredBooksUseCase;

  Future<void> fetchFeaturedBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(FeaturedBooksLoading());
    } else {
      emit(FeaturedBooksPaginationLoading());
    }

    final result = await _featuredBooksUseCase(pageNumber);

    result.fold(
      (failure) {
        if (pageNumber == 0) {
          emit(FeaturedBooksFailure(errorMessage: failure.errMessage));
        }else{
          emit(FeaturedBooksPaginationFailure(errorMessage: failure.errMessage));
        }
        
      },
      (books) {
        emit(FeaturedBooksSuccess(books: books));
      },
    );
  }
}
