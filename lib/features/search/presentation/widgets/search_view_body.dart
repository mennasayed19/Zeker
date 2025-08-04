import 'package:flutter/material.dart';
import 'package:zeker_app/core/utils/app_colors.dart';
import 'package:zeker_app/core/utils/app_strings.dart';
import 'package:zeker_app/core/utils/style_manger.dart';
import 'package:zeker_app/features/search/presentation/widgets/custom_search_text_field.dart';
import 'package:zeker_app/features/search/presentation/widgets/search_list_view.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextField(),
          const SizedBox(height: 20),
          Text(
            AppStrings.searchResults,
            style: StyleManger.textStyleBold18.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(child: SearchListView()),
        ],
      ),
    );
  }
}
