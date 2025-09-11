import 'dart:developer';

import 'package:bookly_app/Features/home/presentation/controllers/cubits/newset_books_cubit/newset_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/newset_books_list_view_item.dart';
import 'package:bookly_app/core/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsetBookListView extends StatefulWidget {
  const NewsetBookListView({super.key, required this.booksList});
  final List<BookEntity> booksList;

  @override
  State<NewsetBookListView> createState() => _NewsetBookListViewState();
}

class _NewsetBookListViewState extends State<NewsetBookListView> {
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollLesener);
  }

  void scrollLesener() async {
    var currentPosition = scrollController.position.pixels;
    var maxScrollLength = scrollController.position.maxScrollExtent;
    if (currentPosition >= 0.7 * maxScrollLength) {
      await BlocProvider.of<NewsetBooksCubit>(context).fetchNewsetBooks();
      // if (!isLoading) {
      //   isLoading = true;
      // }
    }
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log('length : ================>${widget.booksList.length}');
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
          child: NewsetBooksListViewItem(book: widget.booksList[index]),
        );
      }, childCount: widget.booksList.length),
    );
  }
}
