import 'package:bookly_app/Features/Network/model/response/remote_books/item.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/constants.dart';

import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.bookModel});
  final Item bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView, extra: bookModel);
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 2.5 / 4,
              child: CachedNetworkImage(
                imageUrl:
                    bookModel.volumeInfo?.imageLinks?.thumbnail ??
                    'https://share.google/riJZWIZVaJNNVU4Jt',
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),

                errorWidget: (context, url, error) => Icon(Icons.error),
              ),

              // Container(
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(8),
              //       color: Colors.red,
              //       image:  DecorationImage(
              //         fit: BoxFit.fill,
              //         image: CachedNetworkImage(imageUrl: imageUrl)

              //          AssetImage(
              //           AssetsData.testImage,
              //         ),
              //       )),
              // ),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text(
                      '${bookModel.volumeInfo?.title}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle20.copyWith(
                        fontFamily: kGtSectraFine,
                      ),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    '${bookModel.volumeInfo?.authors?[0]}',
                    style: Styles.textStyle14,
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      Text(
                        'Free',
                        style: Styles.textStyle20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      BookRating(
                        rating: bookModel.volumeInfo?.averageRating ?? 0.0,
                        count: bookModel.volumeInfo?.ratingsCount ?? 0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
