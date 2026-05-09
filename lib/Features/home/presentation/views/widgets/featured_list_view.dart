import 'package:bookly_app/Features/home/domain/entities/book_entitiy.dart';
import 'package:bookly_app/Features/home/presentation/maneger/fetch_featured_books/featured_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/maneger/fetch_featured_books/featured_books_state.dart';
import 'package:bookly_app/core/di/helper/snachbar.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/widgets/app_error_widget.dart';
import 'package:bookly_app/core/widgets/app_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'custom_book_item.dart';

class FeaturedBooksListView extends StatefulWidget {
  const FeaturedBooksListView({super.key});

  @override
  State<FeaturedBooksListView> createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
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
    context.read<FeaturedBooksCubit>().fetchFeaturedBooks(
          pageNumber: nextPage,
        );

    nextPage++;
  }

  void _scrollListener() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.7) {
      if (!isLoading) {
        isLoading = true;

        context.read<FeaturedBooksCubit>().fetchFeaturedBooks(
              pageNumber: nextPage,
            );

        nextPage++;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
        listener: (context, state) {
          if (state is FeaturedBooksSuccess) {
            isLoading = false;

            books.addAll(state.books);
          }

          if (state is FeaturedBooksPaginationFailure) {
            isLoading = false;

            ScaffoldMessenger.of(context).showSnackBar(
              buildErrorWidget(state.errorMessage),
            );
          }
        },
        builder: (context, state) {
          if (state is FeaturedBooksFailure) {
            return AppErrorWidget(errorMessage: state.errorMessage);
          }

          if (books.isEmpty && state is FeaturedBooksLoading) {
            return AppLoadingWidget();
          }

          return ListView.builder(
            controller: _scrollController,
            itemCount: books.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  context.go(
                    AppRouter.kBookDetailsView,
                    extra: books[index],
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: CustomBookImage(
                    image: books[index].image ?? '',
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}