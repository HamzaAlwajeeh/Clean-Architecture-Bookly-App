import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/presentation/controllers/cubits/newset_books_cubit/newset_books_state.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksState> {
  NewsetBooksCubit() : super(NewsetBooksInitial());
}
