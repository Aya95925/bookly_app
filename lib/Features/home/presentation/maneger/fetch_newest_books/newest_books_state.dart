part of 'newest_books_cubit.dart';

sealed class NewestBooksState extends Equatable {
  const NewestBooksState();

  @override
  List<Object> get props => [];
}

final class NewestBooksInitial extends NewestBooksState {}

final class NewestBooksLoading extends NewestBooksState {}
final class NewestBooksPaginationLoading extends NewestBooksState {}

final class NewestBooksSuccess extends NewestBooksState {
  final List<BookEntitiy> books;

 const  NewestBooksSuccess({required this.books});
  @override
  List<Object> get props => [];
}

final class NewestBooksFailure extends NewestBooksState {
  final String errorMessage;

  const NewestBooksFailure({required this.errorMessage});
   @override
  List<Object> get props => [];
}
final class NewestBooksPaginationFailure extends NewestBooksState {
  final String errorMessage;

  const NewestBooksPaginationFailure({required this.errorMessage});
   @override
  List<Object> get props => [];
}
