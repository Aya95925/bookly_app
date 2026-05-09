import 'package:bookly_app/Features/Network/model/response/remote_books/item.dart';

abstract class HomeLocalDataSource {
  Future<void> cacheFeaturedBooks(List<Item> books,{int pageNumber=0});
  Future<void> cacheNewestBooks(List<Item> books,{int pageNumber=0});
  Future<void> cacheSimilerBooks(List<Item> books,{int pageNumber=0});


  Future<List<Item>> getCachedFeaturedBooks({int pageNumber=0});
  Future<List<Item>> getCachedNewestBooks({int pageNumber=0});
  Future<List<Item>> getCachedSimilerBooks({int pageNumber=0});

  
}