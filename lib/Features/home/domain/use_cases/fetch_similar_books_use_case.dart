import 'package:bookly_app/Features/home/domain/repos/home_repo.dart';
import 'package:bookly_app/core/entities/book_entity.dart';
import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/use_cases.dart';
import 'package:dartz/dartz.dart';

class FetchSimilarBooksUseCase implements UseCase<List<BookEntity>, String> {
  final HomeRepo homeRepos;

  FetchSimilarBooksUseCase({required this.homeRepos});
  @override
  Future<Either<Failure, List<BookEntity>>> call([String? param]) {
    return homeRepos.fetchSimilarBooks(category: param!);
  }
}
