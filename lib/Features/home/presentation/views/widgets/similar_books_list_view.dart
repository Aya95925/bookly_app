import 'package:bookly_app/Features/home/domain/entities/book_entitiy.dart';
import 'package:bookly_app/Features/home/presentation/maneger/fetch_similer_books/similer_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/maneger/fetch_similer_books/similer_books_state.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:bookly_app/core/widgets/app_error_widget.dart';
import 'package:bookly_app/core/widgets/app_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksListview extends StatefulWidget {
  final String categoryId;

  const SimilarBooksListview({
    super.key,
    required this.categoryId,
  });

  @override
  State<SimilarBooksListview> createState() => _SimilarBooksListviewState();
}

class _SimilarBooksListviewState extends State<SimilarBooksListview> {
  late ScrollController _scrollController;

  int nextPage = 0;
  List<BookEntitiy> books = [];

  bool isLoadingMore = false;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);

  
    context.read<SimilerBooksCubit>().featchSimilerBooks(
          pageNumber: nextPage,
          categoryId: widget.categoryId,
        );

    nextPage++;
  }

  void _scrollListener() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.7) {
      if (!isLoadingMore) {
        isLoadingMore = true;

        context.read<SimilerBooksCubit>().featchSimilerBooks(
              pageNumber: nextPage,
              categoryId: widget.categoryId,
            );

        nextPage++;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: BlocConsumer<SimilerBooksCubit, SimilerBooksState>(
        listener: (context, state) {
          if (state is SimilerBooksSuccess) {
            isLoadingMore = false;

            books.addAll(state.books);
          }
        },
        builder: (context, state) {
          
          if (state is SimilerBooksFailure) {
            return AppErrorWidget(errorMessage: state.errorMessage);
          }

          if (books.isEmpty && state is SimilerBooksLoading) {
            return AppLoadingWidget();
          }

          return ListView.builder(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: CustomBookImage(
                  image: books[index].image ?? '',
                ),
              );
            },
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}