import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/Search/presentation/controllers/cubits/search_cubit/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
}
