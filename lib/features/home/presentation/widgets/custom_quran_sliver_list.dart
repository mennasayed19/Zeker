import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zeker_app/config/routes/app_routes.dart';
import 'package:zeker_app/features/home/presentation/widgets/surah_list_view_item.dart';
import 'package:quran/quran.dart' as quran;

class CustomQuranSliverList extends StatelessWidget {
  const CustomQuranSliverList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GestureDetector(
            onTap: () {
              GoRouter.of(context).push(
                AppRoutes.surahView,
                extra: index + 1,
              );
            },
            child: SurahListViewItem(
              surahName: quran.getSurahNameArabic(index + 1),
              surahNumber: index,
              surahLocation: quran.getPlaceOfRevelation(index + 1),
              ayatNumber: quran.getVerseCount(index + 1),
            ),
          ),
        ),
        childCount: quran.totalSurahCount,
      ),
    );
  }
}
