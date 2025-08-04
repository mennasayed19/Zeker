import 'package:dio/dio.dart';

class ApiService {
  final String _baseTimeUrl = 'https://api.aladhan.com/v1/timingsByCity/';
  final String _baseRadioUrl = 'https://mp3quran.net/api/v3/';
  final String _baseUrl =
      'https://api3.islamhouse.com/v3/paV29H2gm56kvLPy/main/';
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> getTime({required String endPoint}) async {
    var response = await _dio.get(_baseTimeUrl + endPoint);
    return response.data;
  }

  Future<Map<String, dynamic>> getRadio({required String endPoint}) async {
    var response = await _dio.get(_baseRadioUrl + endPoint);
    return response.data;
  }

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get(_baseUrl + endPoint);

    return response.data;
  }
}
