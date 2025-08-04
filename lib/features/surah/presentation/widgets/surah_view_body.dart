import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zeker_app/core/helpers/audio_player.dart';
import 'package:zeker_app/features/surah/presentation/widgets/custom_sruah_bar.dart';
import 'package:quran/quran.dart' as quran;

class SurahViewBody extends StatelessWidget {
  const SurahViewBody({
    super.key,
    required this.surahIndex,
  });
  final int surahIndex;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CustomSurahBar(
            surahNumber: surahIndex,
            verseNumber: quran.getVerseCount(surahIndex),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.only(top: 20),
              itemCount: quran.getVerseCount(surahIndex),
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final verseNumber = index + 1;

                return ListTile(
                  onLongPress: () async {
                    try {
                      String url =
                          quran.getAudioURLByVerse(surahIndex, verseNumber);
                      log('Playing audio for verse $verseNumber: $url');

                      // Play the audio
                      await CustomAudioPlayer.play(url: url);
                    } catch (e) {
                      log('Error playing audio: $e');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'Failed to play audio for verse $verseNumber'),
                        ),
                      );
                    }
                  },
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  title: Text(
                    quran.getVerse(
                      surahIndex,
                      verseNumber,
                      verseEndSymbol: true,
                    ),
                    textAlign: TextAlign.right,
                    style: GoogleFonts.amiri(
                      fontSize: 24,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
