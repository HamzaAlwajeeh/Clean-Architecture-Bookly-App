import 'package:bookly_app/Features/Home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:bookly_app/Features/home/presentation/controllers/cubits/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/controllers/cubits/similar_books_cubit/similar_books_state.dart';
import 'package:bookly_app/core/utils/widgets/custom_loading_indecator.dart';
import 'package:bookly_app/core/widgets/custom_error_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksListViewBlocBuildr extends StatelessWidget {
  const SimilarBooksListViewBlocBuildr({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SimilarBookListView(books: state.books);
        } else if (state is SimilarBooksFailure) {
          return CustomErrorMessage(erroeMessage: state.errorMessage);
        } else {
          return const CustomLoadingIndecator();
        }
      },
    );
  }
}
