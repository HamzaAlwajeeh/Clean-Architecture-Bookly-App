import 'package:bookly_app/Features/Home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:bookly_app/Features/home/presentation/views/sections/home_view_header.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/featured_books_list_view_bloc_builder.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeViewHeader(),
        Expanded(
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FeaturedBooksListViewBlocBuilder(),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text('Best Seller', style: Styles.textStyle18),
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
              BestSellerListView(),
            ],
          ),
        ),
      ],
    );
  }
}
