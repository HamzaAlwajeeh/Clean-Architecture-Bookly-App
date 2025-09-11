import 'package:bookly_app/Features/home/presentation/controllers/cubits/similar_books_cubit/similar_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit() : super(SimilarBooksInitial());
}
