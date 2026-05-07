




import 'package:bookly_app/Features/home/domain/entities/book_entitiy.dart';
import 'package:equatable/equatable.dart';

sealed class FeaturedBooksState extends Equatable {
  const FeaturedBooksState();

  @override
  List<Object> get props => [];
}

final class FeaturedBooksInitial extends FeaturedBooksState {}

final class FeaturedBooksLoading extends FeaturedBooksState {}

final class FeaturedBooksSuccess extends FeaturedBooksState {
  final List<BookEntitiy> books;

  const FeaturedBooksSuccess({required this.books});

  @override
  List<Object> get props => [books];
}

final class FeaturedBooksFailure extends FeaturedBooksState {
  final String errorMessage;

  const FeaturedBooksFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}