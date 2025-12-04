import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quran/quran.dart' as quran;
import 'package:zeker_app/core/helpers/audio_player.dart';
import 'package:zeker_app/features/search/data/models/search_model/result.dart';
import 'package:zeker_app/features/search/data/models/search_model/search_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  SearchModel? searchModel;
  bool isPlaying = false;
  void search({required List<String> words}) {
    String query = words.first.trim();
    log('Searching for: $query');
    if (query.isEmpty) {
      searchModel = SearchModel(occurences: 0, result: []);
      emit(SearchLoaded(searchModel: searchModel!, isPlaying: false));
      return;
    }

    emit(SearchLodaing());

    List<Result> matches = [];

    for (int s = 1; s <= 114; s++) {
      int versesCount = quran.getVerseCount(s);

      for (int v = 1; v <= versesCount; v++) {
        String verseText = quran.getVerse(s, v);

        if (_normalize(verseText).contains(_normalize(query))) {
          matches.add(Result(surah: s, verse: v));
        }
      }
    }

    if (matches.isEmpty) {
      emit(SearchFailure(message: "لا توجد نتائج"));
    } else {
      searchModel = SearchModel(occurences: matches.length, result: matches);
      emit(SearchLoaded(searchModel: searchModel!, isPlaying: false));
    }
  }

  SearchModel _mapResultToSearchModel(Map<dynamic, dynamic> result) {
    int occurrences = result['occurrences'] ?? 0;
    List<Result> results = [];

    if (result['result'] != null && result['result'] is List) {
      results = (result['result'] as List)
          .map((item) => Result.fromJson(item))
          .toList();
    }

    return SearchModel(
      occurences: occurrences,
      result: results,
    );
  }

  void playAudio({required int surahNumber, required int verseNumber}) {
    if (state is SearchLoaded) {
      final currentState = state as SearchLoaded;
      if (currentState.isPlaying) {
        CustomAudioPlayer.stop();
        emit(currentState.copyWith(isPlaying: false));
      } else {
        CustomAudioPlayer.play(
          url: quran.getAudioURLByVerse(surahNumber, verseNumber),
        );
        emit(currentState.copyWith(isPlaying: true));
      }
    }
  }
}

String _normalize(String text) {
  return text
      .replaceAll(RegExp(r'[ًٌٍَُِّْـ]'), '') // Remove tashkeel
      .replaceAll('أ', 'ا')
      .replaceAll('إ', 'ا')
      .replaceAll('آ', 'ا')
      .replaceAll('ؤ', 'و')
      .replaceAll('ئ', 'ي')
      .replaceAll('ة', 'ه')
      .replaceAll('ى', 'ي')
      .trim();
}
