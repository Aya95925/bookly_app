part of 'featured_books_cubit.dart';

sealed class FeaturedBooksState extends Equatable {
  const FeaturedBooksState();

  @override
  List<Object> get props => [];
}

final class FeaturedBooksInitial extends FeaturedBooksState {}

final class FeaturedBooksLoading extends FeaturedBooksState {}

final class FeaturedBooksSuccess extends FeaturedBooksState {
  final List<Item> books;

  const FeaturedBooksSuccess({required this.books});
}

final class FeaturedBookserror extends FeaturedBooksState {
  final String errorMessage;

  const FeaturedBookserror({required this.errorMessage});
}
