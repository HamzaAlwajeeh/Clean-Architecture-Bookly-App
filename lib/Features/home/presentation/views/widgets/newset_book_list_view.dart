import 'package:bookly_app/Features/home/presentation/views/widgets/newset_books_list_view_item.dart';
import 'package:bookly_app/core/entities/book_entity.dart';
import 'package:flutter/material.dart';

class NewsetBookListView extends StatelessWidget {
  const NewsetBookListView({super.key, required this.booksList});
  final List<BookEntity> booksList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
          child: NewsetBooksListViewItem(),
        );
      },
      itemCount: booksList.length,
    );
  }
}
