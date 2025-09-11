import 'package:bookly_app/Features/home/presentation/views/widgets/newset_books_list_view_item.dart';
import 'package:bookly_app/core/entities/book_entity.dart';
import 'package:flutter/material.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key, required this.books});

  final List<BookEntity> books;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: books.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: NewsetBooksListViewItem(book: books[index]),
        );
      },
    );
  }
}
