// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:zeker_app/core/api/api_service.dart';
import 'package:zeker_app/core/errors/failure.dart';
import 'package:zeker_app/features/radio/data/models/radio_model/radio_model.dart';
import 'package:zeker_app/features/radio/data/repositories/radio_repo.dart';

class RadioRepoImpl implements RadioRepo {
  ApiService apiService;
  RadioRepoImpl({
    required this.apiService,
  });
  @override
  Future<Either<Failure, RadioModel>> fetchRadioData() async {
    try {
      var data = await apiService.getRadio(
          endPoint: 'radios?language=ar');
      if (data.isNotEmpty) {
        RadioModel booksModel = RadioModel.fromJson(data);
        return right(booksModel);
      } else {
        return left(
            ServerFailure(errorMessage: 'No data found in the response'));
      }
    } catch (e) {
      log(e.toString());
      if (e is DioException) {
        return left(ServerFailure.fromDioError(dioException: e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
