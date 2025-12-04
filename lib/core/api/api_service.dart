import 'dart:developer';
import 'package:dio/dio.dart';

class ApiService {
  final String _baseTimeUrl = 'https://api.aladhan.com/v1/timingsByCity/';
  final String _baseRadioUrl = 'https://mp3quran.net/api/v3/';
  final String _baseUrl =
      'https://api3.islamhouse.com/v3/paV29H2gm56kvLPy/main/';
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> getTime({required String endPoint}) async {
    try {
      final response = await _dio.get(_baseTimeUrl + endPoint);
      return response.data;
    } catch (e) {
      log('Error fetching time: $e');
      return {};
    }
  }

  Future<Map<String, dynamic>> getRadio({required String endPoint}) async {
    try {
      final response = await _dio.get(_baseRadioUrl + endPoint);
      return response.data;
    } catch (e) {
      log('Error fetching radio: $e');
      return {};
    }
  }

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    try {
      final response = await _dio.get(_baseUrl + endPoint);
      return response.data;
    } catch (e) {
      log('Error fetching data: $e');
      return {};
    }
  }

  Future<Map<String, dynamic>> getReciterItems(String itemApiUrl) async {
    try {
      final response = await _dio.get(itemApiUrl);
      return response.data;
    } catch (e) {
      log('Error fetching reciter items: $e');
      return {};
    }
  }

  Future<String?> getVerseAudioFromReciter({
    required String itemApiUrl,
    required int surah,
    required int verse,
  }) async {
    final data = await getReciterItems(itemApiUrl);
    for (var surahItem in data['items'] ?? []) {
      if (surahItem['surah_number'] == surah) {
        for (var verseItem in surahItem['verses'] ?? []) {
          if (verseItem['verse_number'] == verse) {
            return verseItem['audio_url'];
          }
        }
      }
    }
    return null;
  }

  Future<String?> getSurahAudioFromReciter({
    required String itemApiUrl,
    required int surah,
  }) async {
    final data = await getReciterItems(itemApiUrl);
    for (var surahItem in data['items'] ?? []) {
      if (surahItem['surah_number'] == surah) {
        return surahItem['audio_url'];
      }
    }
    return null;
  }
}
