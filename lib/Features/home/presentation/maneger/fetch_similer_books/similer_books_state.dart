import 'package:bookly_app/Features/home/domain/entities/book_entitiy.dart';
import 'package:equatable/equatable.dart';

sealed class SimilerBooksState extends Equatable {
  const SimilerBooksState();

  @override
  List<Object> get props => [];
}

final class SimilerBooksInitial extends SimilerBooksState {}

final class SimilerBooksLoading extends SimilerBooksState {}

final class SimilerBooksPaginationLoading extends SimilerBooksState {}

final class SimilerBooksSuccess extends SimilerBooksState {
  final List<BookEntitiy> books;

  const SimilerBooksSuccess({required this.books});
}

final class SimilerBooksFailure extends SimilerBooksState {
  final String errorMessage;

  const SimilerBooksFailure({required this.errorMessage});
}

final class SimilerBooksPaginationFailure extends SimilerBooksState {
  final String errorMessage;

const  SimilerBooksPaginationFailure({required this.errorMessage});
}
