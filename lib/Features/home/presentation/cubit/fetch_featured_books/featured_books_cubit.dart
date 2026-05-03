import 'package:bookly_app/Features/Network/model/response/remote_books/item.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  final HomeRepoImpl _homeRepoImpl;
  FeaturedBooksCubit(this._homeRepoImpl) : super(FeaturedBooksInitial());
  Future<void> loadFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    var result = await _homeRepoImpl.fetchFeaturedBooks();
    result.fold(
      (failure) {
        emit(FeaturedBookserror(errorMessage: failure.errorMessage));
      },
      (book) {
       emit( FeaturedBooksSuccess(books: book));
      },
    );
  }
}
