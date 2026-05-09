class BookEntitiy {
  final String bookId;
  final String? image;
  final String? title;
  final List<String>? authorName;
  final num? count;
  final num? rating;
  final String? infoLink;

  BookEntitiy({
    required this.bookId,
    required this.image,
    required this.title,
    required this.authorName,
    required this.count,
    required this.rating,
    required this.infoLink,
  });
}
