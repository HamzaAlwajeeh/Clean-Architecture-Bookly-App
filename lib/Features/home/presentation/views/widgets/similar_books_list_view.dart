import 'package:bookly_app/Features/Home/presentation/views/widgets/custom_book_item.dart';
import 'package:bookly_app/core/entities/book_entity.dart';
import 'package:flutter/material.dart';

class SimilarBookListView extends StatelessWidget {
  const SimilarBookListView({super.key, required this.books});
  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: books.length,
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.only(left: 10),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: CustomBookItem(book: books[index]),
        );
      },
    );
  }
}
