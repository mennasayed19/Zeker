import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/quran.dart' as quran;
import 'package:zeker_app/core/api/api_service.dart';
import 'package:zeker_app/core/helpers/SurahAudioPlayer.dart';
import 'package:zeker_app/features/surah/presentation/widgets/custom_sruah_bar.dart';

class SurahViewBody extends StatefulWidget {
  final int surahIndex;

  const SurahViewBody({super.key, required this.surahIndex});

  @override
  State<SurahViewBody> createState() => _SurahViewBodyState();
}

class _SurahViewBodyState extends State<SurahViewBody> {
  String? selectedReciterApiUrl;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CustomSurahBar(
            surahNumber: widget.surahIndex,
            verseNumber: quran.getVerseCount(widget.surahIndex),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.only(top: 20),
              itemCount: quran.getVerseCount(widget.surahIndex),
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final verseNumber = index + 1;

                return ListTile(
                  onTap: () async {
                    try {
                      await CustomAudioPlayerr.stop();
                      String? url;

                      if (selectedReciterApiUrl != null) {
                        url = await ApiService(Dio()).getVerseAudioFromReciter(
                          itemApiUrl: selectedReciterApiUrl!,
                          surah: widget.surahIndex,
                          verse: verseNumber,
                        );
                      }

                      url ??= quran.getAudioURLByVerse(
                          widget.surahIndex, verseNumber);

                      log('Playing audio for verse $verseNumber: $url');
                      await CustomAudioPlayerr.play(url: url);
                    } catch (e) {
                      log('Error playing audio: $e');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(
                                'Failed to play audio for verse $verseNumber')),
                      );
                    }
                  },
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  title: Text(
                    quran.getVerse(widget.surahIndex, verseNumber,
                        verseEndSymbol: true),
                    textAlign: TextAlign.right,
                    style: GoogleFonts.amiri(fontSize: 24),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(16),
            ),
            onPressed: () async {
              try {
                await CustomAudioPlayerr.stop();
                String? url;

                if (selectedReciterApiUrl != null) {
                  url = await ApiService(Dio()).getSurahAudioFromReciter(
                    itemApiUrl: selectedReciterApiUrl!,
                    surah: widget.surahIndex,
                  );
                }

                url ??= quran.getAudioURLBySurah(widget.surahIndex);

                log('Playing full Surah audio: $url');
                await CustomAudioPlayerr.play(url: url);
              } catch (e) {
                log('Error playing full Surah audio: $e');
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Failed to play full Surah audio')),
                );
              }
            },
            child: const Icon(Icons.play_arrow, size: 30),
          ),
        ],
      ),
    );
  }
}
