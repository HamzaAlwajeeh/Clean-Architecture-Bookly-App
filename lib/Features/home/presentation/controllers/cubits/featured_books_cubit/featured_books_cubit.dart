import 'package:bookly_app/Features/home/domain/use_cases/feach_feature_books_use_case.dart';
import 'package:bookly_app/Features/home/presentation/controllers/cubits/featured_books_cubit/featured_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.feachFeatureBooksUseCase)
    : super(FeaturedBooksInitial());

  final FeachFeatureBooksUseCase feachFeatureBooksUseCase;
  int pageNumber = 0;
  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    var result = await feachFeatureBooksUseCase.call(pageNumber);

    result.fold((failure) => emit(FeaturedBooksFailure(failure.errorMessage)), (
      books,
    ) {
      emit(FeaturedBooksSuccess(books));
      pageNumber += 1;
    });
  }
}
