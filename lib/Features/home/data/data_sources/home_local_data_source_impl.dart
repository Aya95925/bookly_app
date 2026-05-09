import 'package:bookly_app/Features/Network/model/response/remote_books/item.dart';
import 'package:bookly_app/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly_app/core/cashe/shared_pref_utils.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeLocalDataSource)
class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  final SharedPrefUtils _sharedPrefUtils;

  HomeLocalDataSourceImpl(this._sharedPrefUtils);

  @override
  Future<void> cacheFeaturedBooks(
    List<Item> books, {
    int pageNumber = 0,
  }) async {
    final oldBooks = await _sharedPrefUtils.getFeaturedBooks();

    oldBooks.addAll(books);

    await _sharedPrefUtils.saveFeaturedBooks(oldBooks);
  }

  @override
  Future<List<Item>> getCachedFeaturedBooks({int pageNumber = 0}) async {
    final startIndex = pageNumber * 10;
    final endIndex = startIndex + 10;
    final books = await _sharedPrefUtils.getFeaturedBooks();
    if (startIndex >= books.length) {
      return [];
    }
    final safeEndIndex = endIndex > books.length ? books.length : endIndex;
    return books.sublist(startIndex, safeEndIndex);
  }

  @override
  Future<void> cacheNewestBooks(List<Item> books, {int pageNumber = 0}) async {
    final oldBooks = await _sharedPrefUtils.getNewestBooks();
    oldBooks.addAll(books);

    await _sharedPrefUtils.saveNewestBooks(oldBooks);
  }

  @override
  Future<List<Item>> getCachedNewestBooks({int pageNumber = 0}) async {
    final startIndex = pageNumber * 10;
    final endIndex = startIndex + 10;
    final books = await _sharedPrefUtils.getNewestBooks();
    if (startIndex >= books.length) {
      return [];
    }
    final safeIndex = endIndex > books.length ? books.length : endIndex;
    return books.sublist(startIndex, safeIndex);
  }

  @override
  Future<void> cacheSimilerBooks(List<Item> books, {int pageNumber = 0}) async {
    final oldBooks = await _sharedPrefUtils.getSimilerBooks();
    oldBooks.addAll(books);

    return _sharedPrefUtils.saveSimilerBooks(oldBooks);
  }

  @override
  Future<List<Item>> getCachedSimilerBooks({int pageNumber=0}) async {
    final startIndex = pageNumber * 10;
    final endIndex = startIndex + 10;
    final books = await _sharedPrefUtils.getSimilerBooks();
    if (startIndex >= books.length) {
      return [];
    }
    final safeIndex = endIndex > books.length ? books.length : endIndex;
    return books.sublist(startIndex, safeIndex);
    
  }
}
