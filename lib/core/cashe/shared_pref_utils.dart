import 'dart:convert';

import 'package:bookly_app/Features/Network/model/response/remote_books/item.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class SharedPrefUtils {
  final SharedPreferences sharedPreferences;

  SharedPrefUtils(this.sharedPreferences);

  /// ==============================
  /// Keys
  /// ==============================
  static const String featuredBooksKey = 'featured_books';
  static const String newestBooksKey = 'newest_books';
  static const String similerBooksKey = 'similer_books';

  /// ==============================
  /// Save Featured Books
  /// ==============================
  Future<void> saveFeaturedBooks(List<Item> books) async {
    final List<String> booksJson = books
        .map((book) => jsonEncode(book.toJson()))
        .toList();

    await sharedPreferences.setStringList(featuredBooksKey, booksJson);
  }

  Future<void> saveSimilerBooks(List<Item> books) async {
    final List<String> booksJson = books
        .map((book) => jsonEncode(book.toJson()))
        .toList();
    await sharedPreferences.setStringList(similerBooksKey, booksJson);
  }

  /// ==============================
  /// Get Featured Books
  /// ==============================
  Future<List<Item>> getFeaturedBooks() async {
    final List<String>? booksString = sharedPreferences.getStringList(
      featuredBooksKey,
    );

    if (booksString == null || booksString.isEmpty) {
      return [];
    }

    return booksString.map((book) => Item.fromJson(jsonDecode(book))).toList();
  }

  Future<List<Item>> getSimilerBooks() async {
    final List<String>? books = sharedPreferences.getStringList(
      similerBooksKey,
    );
    if (books == null || books.isEmpty) {
      return [];
    }
    return books.map((book) => Item.fromJson(jsonDecode(book))).toList();
  }

  /// ==============================
  /// Save Newest Books
  /// ==============================
  Future<void> saveNewestBooks(List<Item> books) async {
    final List<String> booksJson = books
        .map((book) => jsonEncode(book.toJson()))
        .toList();

    await sharedPreferences.setStringList(newestBooksKey, booksJson);
  }

  /// ==============================
  /// Get Newest Books
  /// ==============================
  Future<List<Item>> getNewestBooks() async {
    final List<String>? booksString = sharedPreferences.getStringList(
      newestBooksKey,
    );

    if (booksString == null || booksString.isEmpty) {
      return [];
    }

    return booksString.map((book) => Item.fromJson(jsonDecode(book))).toList();
  }

  /// ==============================
  /// Remove Featured Books
  /// ==============================
  Future<void> removeFeaturedBooks() async {
    await sharedPreferences.remove(featuredBooksKey);
  }

  /// ==============================
  /// Remove Newest Books
  /// ==============================
  Future<void> removeNewestBooks() async {
    await sharedPreferences.remove(newestBooksKey);
  }

  /// ==============================
  /// Clear All Cache
  /// ==============================
  Future<void> clearAllCache() async {
    await sharedPreferences.clear();
  }

  /// ==============================
  /// Check if Featured Books Exist
  /// ==============================
  bool hasFeaturedBooks() {
    return sharedPreferences.containsKey(featuredBooksKey);
  }

  /// ==============================
  /// Check if Newest Books Exist
  /// ==============================
  bool hasNewestBooks() {
    return sharedPreferences.containsKey(newestBooksKey);
  }
}
