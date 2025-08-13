import 'package:bookly_app/Features/Home/presentation/views/widgets/book_details_custom_app_bar.dart';
import 'package:bookly_app/Features/Home/presentation/views/widgets/book_details_section.dart';
import 'package:bookly_app/Features/Home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              BookDetailsCustomAppBar(),
              BookDetailsSection(),
              Expanded(child: SizedBox(height: 30)),
              SimilarBooksSection(),
              SizedBox(height: 40),
            ],
          ),
        ),
      ],
    );
  }
}
