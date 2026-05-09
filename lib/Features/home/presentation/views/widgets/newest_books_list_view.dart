import 'package:bookly_app/Features/home/domain/entities/book_entitiy.dart';
import 'package:bookly_app/Features/home/presentation/maneger/fetch_newest_books/newest_books_cubit.dart';
import 'package:bookly_app/core/di/helper/snachbar.dart';
import 'package:bookly_app/core/widgets/app_error_widget.dart';
import 'package:bookly_app/core/widgets/app_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'newest_books_list_view_item.dart';

class NewestBooks extends StatefulWidget {
  const NewestBooks({super.key});

  @override
  State<NewestBooks> createState() => _NewestBooksState();
}

class _NewestBooksState extends State<NewestBooks> {
  late ScrollController _scrollController;

  int nextPage = 1;
  bool isLoading = false;

  List<BookEntitiy> books = [];

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);

    // أول تحميل
    context.read<NewestBooksCubit>().featchNewestBooks(
          pageNumber: nextPage,
        );

    nextPage++;
  }

  void _scrollListener() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.7) {
      if (!isLoading) {
        isLoading = true;

        context.read<NewestBooksCubit>().featchNewestBooks(
              pageNumber: nextPage,
            );

        nextPage++;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubit, NewestBooksState>(
      listener: (context, state) {
        if (state is NewestBooksSuccess) {
          isLoading = false;
          books.addAll(state.books);
        }

        if (state is NewestBooksPaginationFailure) {
          isLoading = false;
          ScaffoldMessenger.of(context).showSnackBar(
            buildErrorWidget(state.errorMessage),
          );
        }
      },
      builder: (context, state) {
        if (state is NewestBooksFailure) {
          return AppErrorWidget(errorMessage: state.errorMessage);
        }

        if (books.isEmpty && state is NewestBooksLoading) {
          return AppLoadingWidget();
        }

        return ListView.builder(
          controller: _scrollController,
          padding: EdgeInsets.zero,
          itemCount: books.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: NewestBookListViewItem(
                books: books[index],
              ),
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}