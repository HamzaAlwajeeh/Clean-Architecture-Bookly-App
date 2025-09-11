import 'package:bookly_app/Features/Search/presentation/views/widgets/custom_text_field.dart';
import 'package:bookly_app/Features/Search/presentation/views/widgets/search_result_list_view_bloc_builder.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(),
            const SizedBox(height: 20),
            Text(
              'Search Results',
              style: Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(child: SearchResultListViewBolcBuilder()),
          ],
        ),
      ),
    );
  }
}
