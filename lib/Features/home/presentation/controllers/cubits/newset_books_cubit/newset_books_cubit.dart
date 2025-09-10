import 'package:bookly_app/Features/home/domain/use_cases/fetch_newset_books_use_case.dart';
import 'package:bookly_app/Features/home/presentation/controllers/cubits/newset_books_cubit/newset_books_state.dart';
import 'package:bookly_app/core/entities/book_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksState> {
  NewsetBooksCubit(this.fetchNewsetBooksUseCase) : super(NewsetBooksInitial());

  final FetchNewsetBooksUseCase fetchNewsetBooksUseCase;
  int pageNumber = 0;
  late BookEntity bookDetails;

  Future<void> fetchNewsetBooks() async {
    if (pageNumber == 0) {
      emit(NewsetBooksLoading());
    } else {
      emit(NewsetBooksPaginationLoading());
    }
    var result = await fetchNewsetBooksUseCase.call(pageNumber);

    result.fold((failure) => emit(NewsetBooksFailure(failure.errorMessage)), (
      books,
    ) {
      emit(NewsetBooksSuccess(books));
      pageNumber++;
    });
  }
}
