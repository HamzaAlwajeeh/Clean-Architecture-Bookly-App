import 'package:bookly_app/core/entities/book_entity.dart';
import 'package:hive/hive.dart';

List<BookEntity> saveDataToLocalSource({
  required List<BookEntity> books,
  required String boxName,
}) {
  var box = Hive.box<BookEntity>('featured_box');
  box.addAll(books);
  return books;
}
