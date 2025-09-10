import 'package:bookly_app/Features/home/presentation/controllers/cubits/newset_books_cubit/newset_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/controllers/cubits/newset_books_cubit/newset_books_state.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/newset_book_list_view.dart';
import 'package:bookly_app/core/constants/constants.dart';
import 'package:bookly_app/core/entities/book_entity.dart';
import 'package:bookly_app/core/functions/custom_toast_bar.dart';
import 'package:bookly_app/core/utils/widgets/custom_loading_indecator.dart';
import 'package:bookly_app/core/widgets/custom_error_message.dart';
import 'package:delightful_toast/toast/utils/enums.dart';
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
        } else if (state is NewsetBooksPaginationFailure) {
          customToastBar(
            context: context,
            message: state.errMessage,
            icon: Icons.error,
            backgroundColor: kPrimaryColor,
            textColor: Colors.white,
            postion: DelightSnackbarPosition.bottom,
          );
        }
      },
      builder: (context, state) {
        if (state is NewsetBooksSuccess ||
            state is NewsetBooksPaginationLoading ||
            state is NewsetBooksPaginationFailure) {
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
