import 'package:bookly_app/Features/home/presentation/cubit/fetch_newest_books/newest_books_cubit.dart';
import 'package:bookly_app/core/widgets/app_error.dart';
import 'package:bookly_app/core/widgets/app_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'best_seller_list_view_item.dart';

class NewestListView extends StatelessWidget {
  const NewestListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: 10,
            itemBuilder: (context, index) {
              return  Padding(
                padding:const EdgeInsets.symmetric(vertical: 10),
                child: BookListViewItem(bookModel:state.newedtBooks[index],),
              );
            },
          );
        } else if (state is NewestBooksError) {
          return AppError(errorMessage: state.errorMessage);
        } else {
          return AppLoading();
        }
      },
    );
  }
}
