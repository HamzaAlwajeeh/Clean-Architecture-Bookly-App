// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bookly_app/Features/Search/domain/repos/search_repo.dart';
import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/models/entities/book_entity.dart';
import 'package:bookly_app/core/use_cases.dart';
import 'package:dartz/dartz.dart';

class SearchBooksUseCase extends UseCase<List<BookEntity>, String> {
  SearchRepo searchRepo;
  SearchBooksUseCase({required this.searchRepo});
  @override
  Future<Either<Failure, List<BookEntity>>> call([String? param]) async {
    return await searchRepo.searchBooks(searchWord: param!);
  }
}
