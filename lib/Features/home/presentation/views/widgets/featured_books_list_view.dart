import 'package:bookly_app/Features/Home/presentation/views/widgets/custom_book_item.dart';
import 'package:bookly_app/Features/home/presentation/controllers/cubits/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/core/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBookslistview extends StatefulWidget {
  const FeaturedBookslistview({super.key, required this.booksList});
  final List<BookEntity> booksList;

  @override
  State<FeaturedBookslistview> createState() => _FeaturedBookslistviewState();
}

class _FeaturedBookslistviewState extends State<FeaturedBookslistview> {
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
      if (!isLoading) {
        await BlocProvider.of<FeaturedBooksCubit>(context).fetchFeaturedBooks();
        isLoading = true;
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
        controller: scrollController,
        padding: EdgeInsets.only(left: 10),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: CustomBookItem(image: widget.booksList[index].image ?? ''),
          );
        },
        itemCount: widget.booksList.length,
      ),
    );
  }
}
