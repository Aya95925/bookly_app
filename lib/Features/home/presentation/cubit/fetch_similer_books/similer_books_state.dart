part of 'similer_books_cubit.dart';

sealed class SimilerBooksState extends Equatable {
  const SimilerBooksState();

  @override
  List<Object> get props => [];
}

final class SimilerBooksInitial extends SimilerBooksState {}

final class SimilerBooksLoading extends SimilerBooksState {}

final class SimilerBooksSuccess extends SimilerBooksState {
  final List<Item> books;

  const SimilerBooksSuccess({required this.books});
}

final class SimilerBooksErrors extends SimilerBooksState {
  final String errorMessage;

  const SimilerBooksErrors({required this.errorMessage});
}
