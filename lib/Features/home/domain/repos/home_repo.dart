import 'package:bookly_app/core/entities/book_entity.dart';
import 'package:bookly_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks({
    int pageNumber = 0,
  });
  Future<Either<Failure, List<BookEntity>>> fetchNewsetBooks();
}
