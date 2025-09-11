import 'package:bookly_app/core/entities/book_entity.dart';

class SimilarBooksState {}

final class SimilarBooksInitial extends SimilarBooksState {}

final class SimilarBooksLoading extends SimilarBooksState {}

final class SimilarBooksFailure extends SimilarBooksState {
  final String errorMessage;
  SimilarBooksFailure({required this.errorMessage});
}

final class SimilarBooksSuccess extends SimilarBooksState {
  final List<BookEntity> books;
  SimilarBooksSuccess({required this.books});
}
