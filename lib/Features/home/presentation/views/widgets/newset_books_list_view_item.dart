import 'package:bookly_app/Features/Home/presentation/views/widgets/books_rating.dart';
import 'package:bookly_app/core/constants/constants.dart';
import 'package:bookly_app/core/entities/book_entity.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewsetBooksListViewItem extends StatelessWidget {
  const NewsetBooksListViewItem({super.key, this.book});
  final BookEntity? book;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kDetailsView);
      },
      child: Row(
        children: [
          SizedBox(
            height: 140,
            child: AspectRatio(
              aspectRatio: 2 / 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(
                  imageUrl: book?.image ?? '',
                  fit: BoxFit.fill,
                  placeholder:
                      (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          ),
          SizedBox(width: 30),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    book?.title ?? '',
                    style: Styles.textStyle20.copyWith(
                      fontFamily: kGtSectraFine,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 3),
                Text(book?.authorName ?? 'unKnown', style: Styles.textStyle14),
                SizedBox(height: 3),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      book?.price.toString() ?? '0',
                      style: Styles.textStyle20.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    BooksRating(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
