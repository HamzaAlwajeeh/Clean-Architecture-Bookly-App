import 'package:bookly_app/Features/home/data/Models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';

List<BookEntity> getBooksList(Map<String, dynamic> data) {
  List<BookEntity> books = [];
  for (var book in data['items']) {
    books.add(BookModel.fromJson(book));
  }
  return books;
}
