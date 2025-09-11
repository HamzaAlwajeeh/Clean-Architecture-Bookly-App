import 'package:bookly_app/Features/Search/presentation/controllers/cubits/search_cubit/search_cubit.dart';
import 'package:bookly_app/Features/Search/presentation/controllers/cubits/search_cubit/search_state.dart';
import 'package:bookly_app/Features/Search/presentation/views/widgets/search_result_list_view.dart';
import 'package:bookly_app/core/utils/widgets/custom_loading_indecator.dart';
import 'package:bookly_app/core/widgets/custom_error_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListViewBolcBuilder extends StatelessWidget {
  const SearchResultListViewBolcBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          return SearchResultListView(books: state.books);
        } else if (state is SearchFailure) {
          return CustomErrorMessage(erroeMessage: state.errMessage);
        } else {
          return const CustomLoadingIndecator();
        }
      },
    );
  }
}
