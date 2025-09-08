import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/models/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<BookEntity>>> fetchSearchBooks({
    required String searchWord,
  });
}
