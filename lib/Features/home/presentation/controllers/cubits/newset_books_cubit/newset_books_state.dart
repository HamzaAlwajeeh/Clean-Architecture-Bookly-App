import 'package:bookly_app/core/entities/book_entity.dart';

abstract class NewsetBooksState {}

final class NewsetBooksInitial extends NewsetBooksState {}

final class NewsetBooksLoading extends NewsetBooksState {}

final class NewsetBooksPaginationLoading extends NewsetBooksState {}

final class NewsetBooksFailure extends NewsetBooksState {
  final String errMessage;

  NewsetBooksFailure(this.errMessage);
}

final class NewsetBooksPaginationFailure extends NewsetBooksState {
  final String errMessage;

  NewsetBooksPaginationFailure(this.errMessage);
}

final class NewsetBooksSuccess extends NewsetBooksState {
  final List<BookEntity> books;

  NewsetBooksSuccess(this.books);
}
