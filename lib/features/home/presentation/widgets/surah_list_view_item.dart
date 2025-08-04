import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zeker_app/core/utils/app_colors.dart';
import 'package:zeker_app/core/utils/assets_manager.dart';
import 'package:zeker_app/core/utils/media_query_values.dart';
import 'package:zeker_app/core/utils/style_manger.dart';

class SurahListViewItem extends StatelessWidget {
  const SurahListViewItem({
    super.key,
    required this.surahName,
    required this.surahNumber,
    required this.surahLocation,
    required this.ayatNumber,
  });

  final String surahName;
  final int surahNumber;
  final int ayatNumber;
  final String surahLocation;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 7,
          height: 68,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          width: context.width * 0.81,
          height: 68,
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 6,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          AssetsManager.rubElHizb,
                          color: AppColors.primaryColor,
                          width: 50,
                          height: 50,
                        ),
                        Text(
                          '${surahNumber + 1}',
                          style: StyleManger.textStyleMedium14,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 5),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        surahLocation,
                        style: StyleManger.textStyleBold18,
                      ),
                      Text(
                        '$ayatNumber - ايات',
                        style: StyleManger.textStyleMedium14,
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Text(
                surahName,
                style: GoogleFonts.amiri().copyWith(
                  color: AppColors.primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 20),
            ],
          ),
        ),
      ],
    );
  }
}
