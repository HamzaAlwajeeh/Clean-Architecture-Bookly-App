import 'package:bookly_app/Features/home/presentation/controllers/cubits/newset_books_cubit/newset_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/views/sections/book_details_view_body.dart';
import 'package:bookly_app/core/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<NewsetBooksCubit>(context).bookDetails = book;
    return Scaffold(body: BookDetailsViewBody());
  }
}
