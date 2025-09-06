import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  List<BookEntity> fetchFeaturedBooks();
  List<BookEntity> fetchNewsetBooks();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }

  @override
  List<BookEntity> fetchNewsetBooks() {
    // TODO: implement fetchNewsetBooks
    throw UnimplementedError();
  }
}
