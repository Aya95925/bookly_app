import 'package:bookly_app/Features/home/presentation/cubit/fetch_similer_books/similer_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:bookly_app/core/widgets/app_error.dart';
import 'package:bookly_app/core/widgets/app_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksListview extends StatelessWidget {
  const SimilarBooksListview({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: BlocBuilder<SimilerBooksCubit, SimilerBooksState>(
        builder: (context, state) {
          if (state is SimilerBooksSuccess) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return  Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 5),
                  child: CustomBookImage(imageUrl:state.books[index].volumeInfo?.imageLinks?.thumbnail??''),
                );
              },
            );
          } else if (state is SimilerBooksErrors) {
            return AppError(errorMessage: state.errorMessage);
          } else {
            return AppLoading();
          }
        },
      ),
    );
  }
}
