import 'package:bookly_app/Features/Search/data/data_source/search_remote_data_source.dart';
import 'package:bookly_app/Features/Search/domain/repos/search_repo.dart';
import 'package:bookly_app/core/entities/book_entity.dart';
import 'package:bookly_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements SearchRepo {
  final SearchRemoteDataSource searchRemoteDataSource;

  SearchRepoImpl({required this.searchRemoteDataSource});
  @override
  Future<Either<Failure, List<BookEntity>>> searchBooks({
    required String searchWord,
  }) async {
    try {
      List<BookEntity> books = await searchRemoteDataSource.fetchSearchBooks(
        searchWord: searchWord,
      );
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
