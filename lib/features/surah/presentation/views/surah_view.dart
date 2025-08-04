import 'package:flutter/material.dart';
import 'package:zeker_app/features/surah/presentation/widgets/surah_view_body.dart';

class SurahView extends StatelessWidget {
  const SurahView({
    super.key,
    // required this.verseNumber,
    required this.surahNumber,
  });
  // final int verseNumber;
  final int surahNumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SurahViewBody(
        // verseNumber: verseNumber,
        surahIndex: surahNumber,
      ),
    );
  }
}
