import 'package:bookly_app/core/Models/book_model/book_model.dart';
import 'package:bookly_app/core/entities/book_entity.dart';

List<BookEntity> getBooksList(Map<String, dynamic> data) {
  List<BookEntity> books = [];
  for (var book in data['items']) {
    books.add(BookModel.fromJson(book));
  }
  return books;
}
