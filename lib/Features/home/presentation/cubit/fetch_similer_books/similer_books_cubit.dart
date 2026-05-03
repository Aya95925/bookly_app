
import 'package:bookly_app/Features/Network/model/response/remote_books/item.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'similer_books_state.dart';

class SimilerBooksCubit extends Cubit<SimilerBooksState> {
  SimilerBooksCubit({required this.homeRepoImpl}) : super(SimilerBooksInitial());
  final HomeRepoImpl homeRepoImpl;
  Future<void> loadSimilerBooks({required String categoryId}) async {
    emit(SimilerBooksLoading());
    var result = await homeRepoImpl.fetchSimilertBooks(categoryId: categoryId);
    result.fold(
      (faulier) {
        emit(SimilerBooksErrors(errorMessage: faulier.errorMessage));
      },
      (similerBooks) {
        emit(SimilerBooksSuccess(books: similerBooks));
      },
    );
  }

}
