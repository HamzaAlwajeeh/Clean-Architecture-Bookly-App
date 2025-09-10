import 'package:bookly_app/Features/Home/presentation/views/widgets/books_rating.dart';
import 'package:bookly_app/Features/Home/presentation/views/widgets/custom_book_item.dart';
import 'package:bookly_app/Features/Home/presentation/views/widgets/details_actions.dart';
import 'package:bookly_app/Features/home/presentation/controllers/cubits/newset_books_cubit/newset_books_cubit.dart';
import 'package:bookly_app/core/entities/book_entity.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    BookEntity bookDetails =
        BlocProvider.of<NewsetBooksCubit>(context).bookDetails;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            child: CustomBookItem(book: bookDetails),
          ),
          SizedBox(height: 18),
          Text(bookDetails.title, style: Styles.textStyle30),
          SizedBox(height: 2),
          Opacity(
            opacity: 0.7,
            child: Text(
              bookDetails.authorName ?? 'Unknown',
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
