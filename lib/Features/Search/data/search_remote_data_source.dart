import 'package:bookly_app/core/api_service.dart';
import 'package:bookly_app/core/functions/get_books_list.dart';
import 'package:bookly_app/core/models/entities/book_entity.dart';

class SearchRemoteDataSource {
  final ApiService apiService;

  SearchRemoteDataSource({required this.apiService});

  Future<List<BookEntity>> fetchSearchBooks({
    required String searchWord,
  }) async {
    var data = await apiService.get(endPoint: 'volumes?q=$searchWord');
    List<BookEntity> books = getBooksList(data);
    return books;
  }
}
