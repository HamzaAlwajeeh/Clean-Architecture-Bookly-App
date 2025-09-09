import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/Search/domain/use_cases/search_books_use_case.dart';
import 'package:bookly_app/Features/Search/presentation/controllers/cubits/search_cubit/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchBooksUseCase) : super(SearchInitial());
  final SearchBooksUseCase searchBooksUseCase;

  Future<void> searchBooks(String query) async {
    emit(SearchLoading());
    var result = await searchBooksUseCase.call(query);

    result.fold(
      (failure) => emit(SearchFailure(failure.errorMessage)),
      (books) => emit(SearchSuccess(books)),
    );
  }
}
