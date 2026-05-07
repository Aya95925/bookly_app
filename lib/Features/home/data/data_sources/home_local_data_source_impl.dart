import 'package:bookly_app/Features/Network/model/response/remote_books/item.dart';
import 'package:bookly_app/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly_app/core/cashe/shared_pref_utils.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeLocalDataSource)
class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  final SharedPrefUtils _sharedPrefUtils;

  HomeLocalDataSourceImpl(this._sharedPrefUtils);

  /// =========================
  /// Featured Books
  /// =========================

  @override
  Future<void> cacheFeaturedBooks(List<Item> books) async {
    await _sharedPrefUtils.saveFeaturedBooks(books);
  }

  @override
  Future<List<Item>> getCachedFeaturedBooks() async {
    return await _sharedPrefUtils.getFeaturedBooks();
  }

  /// =========================
  /// Newest Books
  /// =========================

  @override
  Future<void> cacheNewestBooks(List<Item> books) async {
    await _sharedPrefUtils.saveNewestBooks(books);
  }

  @override
  Future<List<Item>> getCachedNewestBooks() async {
    return await _sharedPrefUtils.getNewestBooks();
  }
}