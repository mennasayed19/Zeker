import 'package:flutter/material.dart';

import 'package:zeker_app/core/utils/style_manger.dart';
import 'package:zeker_app/features/home/presentation/widgets/category_list_view.dart';
import 'package:zeker_app/features/home/presentation/widgets/home_time_section.dart';
import 'package:zeker_app/features/home/presentation/widgets/data_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          //* Home section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: HomeTimeSection(),
            ),
          ),

          //* Catagorie Text
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Category',
                style: StyleManger.textStyleBold16,
              ),
            ),
          ),
          //* Catagories
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: CategoryListView(),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 21),
          ),
          //* Data List View
          DataListView(),
        ],
      ),
    );
  }
}
