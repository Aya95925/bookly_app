import 'package:bookly_app/Features/Network/model/response/remote_books/item.dart';

abstract class HomeLocalDataSource {
  Future<void> cacheFeaturedBooks(List<Item> books);
  Future<void> cacheNewestBooks(List<Item> books);

  Future<List<Item>> getCachedFeaturedBooks();
  Future<List<Item>> getCachedNewestBooks();
}