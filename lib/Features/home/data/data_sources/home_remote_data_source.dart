import 'package:bookly_app/core/api_service.dart';
import 'package:bookly_app/core/constants/constants.dart';
import 'package:bookly_app/core/entities/book_entity.dart';
import 'package:bookly_app/core/functions/get_books_list.dart';
import 'package:bookly_app/core/functions/save_data_to_local_sourse.dart';

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
    saveDataToLocalSource(books: books, boxName: kFeaturedBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewsetBooks() async {
    var data = await apiService.get(
      endPoint: 'volumes?Filtering=free-ebooks&q=subject:Pharmacy',
    );
    List<BookEntity> books = getBooksList(data);
    saveDataToLocalSource(books: books, boxName: kNewsetBox);
    return books;
  }
}
