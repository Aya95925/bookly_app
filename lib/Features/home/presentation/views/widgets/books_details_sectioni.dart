import 'package:bookly_app/Features/Network/model/response/remote_books/item.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';
import 'books_action.dart';
import 'custom_book_item.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.item});
  final Item item;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .2),
          child:  CustomBookImage(
            imageUrl:item.volumeInfo?.imageLinks?.thumbnail??'' ,
          ),
        ),
        const SizedBox(height: 43),
        Text(
          item.volumeInfo?.title??'No Title',
          textAlign: TextAlign.center,
          style: Styles.textStyle30.copyWith(fontWeight: FontWeight.bold,),
        ),
        const SizedBox(height: 6),
        Opacity(
          opacity: .7,
          child: Text(
            item.volumeInfo?.authors?[0]??'',
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 18),
        BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          rating:item.volumeInfo!.averageRating??0.0,
          count: item.volumeInfo?.ratingsCount??0,
        ),
        const SizedBox(height: 37),
        BooksAction(items: item,),
      ],
    );
  }
}
