
import 'package:bookly_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/Features/home/presentation/cubit/fetch_similer_books/similer_books_cubit.dart';

import 'package:flutter_bloc/flutter_bloc.dart';


class SimilerBooksCubit extends Cubit<SimilerBooksState> {
  SimilerBooksCubit({required this.homeRepoImpl}) : super(SimilerBooksInitial());
  final HomeRepoImpl homeRepoImpl;
  Future<void> loadNewestBooks({required String categoryId}) async {
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
