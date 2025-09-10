// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bookly_app/Features/home/domain/repos/home_repo.dart';
import 'package:bookly_app/core/entities/book_entity.dart';
import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/use_cases.dart';
import 'package:dartz/dartz.dart';

class FeachFeatureBooksUseCase extends UseCase<List<BookEntity>, int> {
  HomeRepo homeRepo;

  FeachFeatureBooksUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call([int? param]) async {
    return await homeRepo.fetchFeaturedBooks();
  }
}
