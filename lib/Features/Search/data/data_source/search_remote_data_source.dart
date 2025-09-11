import 'package:bookly_app/core/api_service.dart';
import 'package:bookly_app/core/entities/book_entity.dart';
import 'package:bookly_app/core/functions/get_books_list.dart';

class SearchRemoteDataSource {
  final ApiService apiService;

  SearchRemoteDataSource({required this.apiService});

  Future<List<BookEntity>> fetchSearchBooks({
    required String searchWord,
  }) async {
    var data = await apiService.get(
      endPoint: 'volumes?filtering=free-ebooks&q=subject:$searchWord',
    );
    List<BookEntity> books = getBooksList(data);
    return books;
  }
}
