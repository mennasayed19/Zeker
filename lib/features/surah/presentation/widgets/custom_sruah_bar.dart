import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zeker_app/core/utils/assets_manager.dart';
import 'package:quran/quran.dart' as quran;

class CustomSurahBar extends StatelessWidget {
  const CustomSurahBar({
    super.key,
    required this.surahNumber,
    required this.verseNumber,
  });
  final int surahNumber;
  final int verseNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            fit: BoxFit.fitHeight,
            height: 50,
            AssetsManager.quranBar,
          ),
          // Positioned(
          //   top: 10,
          //   left: 25,
          //   child: Column(
          //     children: [
          //       Text(
          //         'الجزء',
          //         style: GoogleFonts.amiri(
          //           fontSize: 12,
          //         ),
          //       ),
          //       Text(
          //         quran.getJuzNumber(surahNumber, verseNumber).toString(),
          //         style: GoogleFonts.amiri(
          //           fontSize: 14,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          Text(
            quran.getSurahNameArabic(surahNumber),
            style: GoogleFonts.amiri(
              fontSize: 26,
            ),
          ),
        ],
      ),
    );
  }
}
