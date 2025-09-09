import 'package:bookly_app/core/entities/book_entity.dart';

abstract class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchFailure extends SearchState {
  final String errMessage;

  SearchFailure(this.errMessage);
}

final class SearchSuccess extends SearchState {
  final List<BookEntity> books;

  SearchSuccess(this.books);
}
