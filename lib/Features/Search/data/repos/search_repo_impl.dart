import 'package:bookly_app/Features/Search/domain/repos/search_repo.dart';
import 'package:bookly_app/core/entities/book_entity.dart';
import 'package:bookly_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

class SearchRepoImpl implements SearchRepo {
  @override
  Future<Either<Failure, List<BookEntity>>> searchBooks({
    required String searchWord,
  }) {
    // TODO: implement searchBooks
    throw UnimplementedError();
  }
}
