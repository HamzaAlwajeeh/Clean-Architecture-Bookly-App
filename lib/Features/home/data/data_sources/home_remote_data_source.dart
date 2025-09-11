import 'package:bookly_app/core/api_service.dart';
import 'package:bookly_app/core/constants/constants.dart';
import 'package:bookly_app/core/entities/book_entity.dart';
import 'package:bookly_app/core/functions/get_books_list.dart';
import 'package:bookly_app/core/functions/save_data_to_local_sourse.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchNewsetBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchSimilarBooks({required String category});
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    var data = await apiService.get(
      endPoint:
          'volumes?Filtering=free-ebooks&q=subject:Pharmacy&startIndex=${pageNumber * 10}',
    );

    List<BookEntity> books = getBooksList(data);
    saveDataToLocalSource(books: books, boxName: kFeaturedBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewsetBooks({int pageNumber = 0}) async {
    var data = await apiService.get(
      endPoint:
          'volumes?Filtering=free-ebooks&q=subject:programming&sorting=newset&startIndex=${pageNumber * 10}',
    );
    List<BookEntity> books = getBooksList(data);
    saveDataToLocalSource(books: books, boxName: kNewsetBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchSimilarBooks({required String category}) async {
    var data = await apiService.get(
      endPoint: 'volumes?filtering=free-ebooks&q=subject:$category',
    );
    List<BookEntity> books = getBooksList(data);
    return books;
  }
}
