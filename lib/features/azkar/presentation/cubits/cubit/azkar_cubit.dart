import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zeker_app/features/azkar/data/models/AzkarModel.dart';
import 'package:zeker_app/features/azkar/presentation/cubits/cubit/azkar_state.dart';

class AzkarCubit extends Cubit<AzkarState> {
  AzkarCubit() : super(AzkarInitial());

  final Dio dio = Dio();

  Future<void> fetchAzkar() async {
    emit(AzkarLoading());
    try {
      final response = await dio.get(
        'https://raw.githubusercontent.com/nawafalqari/azkar-api/56df51279ab6eb86dc2f6202c7de26c8948331c1/azkar.json',
        options: Options(responseType: ResponseType.bytes),
      );

      if (response.statusCode == 200) {
        final jsonString = utf8.decode(response.data);
        final dataMap = json.decode(jsonString) as Map<String, dynamic>;

        final List<AzkarModel> allAzkar = [];

        dataMap.forEach((category, listOfItems) {
          if (listOfItems is List) {
            for (var item in listOfItems) {
              if (item is List) {
                for (var sub in item) {
                  if (sub is Map<String, dynamic>) {
                    allAzkar.add(AzkarModel.fromJson(sub));
                  }
                }
              } else if (item is Map<String, dynamic>) {
                allAzkar.add(AzkarModel.fromJson(item));
              }
            }
          }
        });

        emit(AzkarSucces(allAzkar));
      } else {
        emit(AzkarError('فشل تحميل الأذكار'));
      }
    } catch (e) {
      emit(AzkarError('حدث خطأ: $e'));
    }
  }
}
