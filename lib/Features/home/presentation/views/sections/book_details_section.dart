import 'package:bookly_app/Features/Home/presentation/views/widgets/books_rating.dart';
import 'package:bookly_app/Features/Home/presentation/views/widgets/custom_book_item.dart';
import 'package:bookly_app/Features/Home/presentation/views/widgets/details_actions.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            child: CustomBookItem(image: ''),
          ),
          SizedBox(height: 18),
          Text("The Jungle Book", style: Styles.textStyle30),
          SizedBox(height: 2),
          Opacity(
            opacity: 0.7,
            child: Text(
              "Rudyard Kipling",
              style: Styles.textStyle16.copyWith(
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          SizedBox(height: 10),
          BooksRating(),
          SizedBox(height: 25),
          DetailsActions(),
        ],
      ),
    );
  }
}
