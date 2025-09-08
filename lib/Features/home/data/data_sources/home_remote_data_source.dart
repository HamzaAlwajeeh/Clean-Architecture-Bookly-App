import 'package:bookly_app/Features/home/data/Models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/api_service.dart';
import 'package:bookly_app/core/functions/save_data_to_local_sourse.dart';
import 'package:hive/hive.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewsetBooks();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data = await apiService.get(
      endPoint: 'volumes?Filtering=free-ebooks&q=subject:Pharmacy',
    );

    List<BookEntity> books = getBooksList(data);
    return saveDataToLocalSource(books: books, boxName: kFeaturedBox);
  }

  @override
  Future<List<BookEntity>> fetchNewsetBooks() async {
    var data = await apiService.get(
      endPoint:
          'volumes?Filtering=free-ebooks&q=subject:programming&sorting=newset',
    );
    List<BookEntity> books = getBooksList(data);
    var box = Hive.box<BookEntity>(kNewsetBox);
    box.addAll(books);
    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var book in data['items']) {
      books.add(BookModel.fromJson(book));
    }
    return books;
  }
}
