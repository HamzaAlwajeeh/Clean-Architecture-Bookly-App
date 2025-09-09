import 'package:bookly_app/Features/Home/presentation/views/widgets/custom_book_item.dart';
import 'package:bookly_app/core/entities/book_entity.dart';
import 'package:flutter/material.dart';

class FeaturedBookslistview extends StatelessWidget {
  const FeaturedBookslistview({super.key, required this.booksList});
  final List<BookEntity> booksList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
        padding: EdgeInsets.only(left: 10),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: CustomBookItem(image: booksList[index].image ?? ''),
          );
        },
        itemCount: booksList.length,
      ),
    );
  }
}
