import 'package:bookly_app/Features/Network/model/response/remote_books/item.dart';
import 'package:bookly_app/Features/home/domain/entities/book_entitiy.dart';

extension BookMapper on Item {
  BookEntitiy bookEntitiy() {
    return BookEntitiy(
      bookId: id!,
      image: volumeInfo?.imageLinks?.thumbnail ?? '',
      title: volumeInfo?.title ?? 'No title',
      authorName: volumeInfo?.authors?.cast<String>(),

      rating: volumeInfo?.averageRating,
      count: volumeInfo?.ratingsCount,
    );
  }
}
