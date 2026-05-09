import 'package:bookly_app/Features/home/presentation/maneger/fetch_newest_books/newest_books_cubit.dart';
import 'package:bookly_app/core/widgets/app_error_widget.dart';
import 'package:bookly_app/core/widgets/app_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'newest_books_list_view_item.dart';

class NewestBooks extends StatelessWidget {
  const NewestBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: NewestBookListViewItem(books: state.books[index]),
              );
            },
          );
        } else if (state is NewestBooksFailure) {
          return AppErrorWidget(errorMessage: state.errorMessage);
        } else {
          return AppLoadingWidget();
        }
      },
    );
  }
}
