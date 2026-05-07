import 'package:bookly_app/Features/home/presentation/maneger/fetch_featured_books/featured_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/maneger/fetch_featured_books/featured_books_state.dart';
import 'package:bookly_app/core/widgets/app_error_widget.dart';
import 'package:bookly_app/core/widgets/app_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_book_item.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
        builder: (context, state) {
          if (state is FeaturedBooksSuccess) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: CustomBookImage(),
                );
              },
            );
          } else if (state is FeaturedBooksFailure) {
            return AppErrorWidget(errorMessage: state.errorMessage);
          } else {
            return AppLoadingWidget();
          }
        },
      ),
    );
  }
}
