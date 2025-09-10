import 'package:bookly_app/Features/home/presentation/controllers/cubits/newset_books_cubit/newset_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/controllers/cubits/newset_books_cubit/newset_books_state.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/newset_book_list_view.dart';
import 'package:bookly_app/core/entities/book_entity.dart';
import 'package:bookly_app/core/utils/widgets/custom_loading_indecator.dart';
import 'package:bookly_app/core/widgets/custom_error_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsetBooksListViewBlocBuilder extends StatefulWidget {
  const NewsetBooksListViewBlocBuilder({super.key});

  @override
  State<NewsetBooksListViewBlocBuilder> createState() =>
      _NewsetBooksListViewBlocBuilderState();
}

class _NewsetBooksListViewBlocBuilderState
    extends State<NewsetBooksListViewBlocBuilder> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsetBooksCubit, NewsetBooksState>(
      listener: (context, state) {
        if (state is NewsetBooksSuccess) {
          books.addAll(state.books);
        }
      },
      builder: (context, state) {
        if (state is NewsetBooksSuccess ||
            state is NewsetBooksPaginationLoading) {
          return NewsetBookListView(booksList: books);
        } else if (state is NewsetBooksFailure) {
          return CustomErrorMessage(erroeMessage: state.errMessage);
        } else {
          return CustomLoadingIndecator();
        }
      },
    );
  }
}
