import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/domain/use_cases/feach_feature_books_use_case.dart';
import 'package:bookly_app/Features/home/presentation/controllers/featured_books_cubit/featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.feachFeatureBooksUseCase)
    : super(FeaturedBooksInitial());

  final FeachFeatureBooksUseCase feachFeatureBooksUseCase;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    var result = await feachFeatureBooksUseCase.call();

    result.fold(
      (failure) => emit(FeaturedBooksFailure(failure.errorMessage)),
      (books) => emit(FeaturedBooksSuccess(books)),
    );
  }
}
