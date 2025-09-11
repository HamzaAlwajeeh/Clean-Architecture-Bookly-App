import 'package:bookly_app/Features/home/domain/use_cases/fetch_similar_books_use_case.dart';
import 'package:bookly_app/Features/home/presentation/controllers/cubits/similar_books_cubit/similar_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.fetchSimilarBooksUseCase)
    : super(SimilarBooksInitial());
  final FetchSimilarBooksUseCase fetchSimilarBooksUseCase;

  Future<void> fetchSimilarBooks(String category) async {
    emit(SimilarBooksLoading());
    var result = await fetchSimilarBooksUseCase.call(category);
    result.fold(
      (failure) =>
          emit(SimilarBooksFailure(errorMessage: failure.errorMessage)),
      (books) => emit(SimilarBooksSuccess(books: books)),
    );
  }
}
