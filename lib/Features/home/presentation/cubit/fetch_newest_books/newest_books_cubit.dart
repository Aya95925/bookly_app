import 'package:bookly_app/Features/Network/model/response/remote_books/item.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepoImpl) : super(NewestBooksInitial());
  final HomeRepoImpl homeRepoImpl;
  Future<void> loadNewestBooks() async {
    emit(NewestBooksLoading());
    var result = await homeRepoImpl.fetchNewestBooks();
    result.fold(
      (faulier) {
        emit(NewestBooksError(errorMessage: faulier.errorMessage));
      },
      (newestBooks) {
        emit(NewestBooksSuccess(newedtBooks: newestBooks));
      },
    );
  }
}
