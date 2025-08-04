import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:zeker_app/core/api/api_service.dart';
import 'package:zeker_app/core/errors/failure.dart';
import 'package:zeker_app/features/home/data/models/books_model/books_model.dart';
import 'package:zeker_app/features/home/data/models/fatwa_model/fatwa_model.dart';
import 'package:zeker_app/features/home/data/models/khotab_model/khotab_model.dart';
import 'package:zeker_app/features/home/data/models/salah_time_date/salah_time_date.dart';
import 'package:zeker_app/features/home/data/models/videos_model/videos_model.dart';
import 'package:zeker_app/features/home/data/repositories/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;
  HomeRepoImpl({
    required this.apiService,
  });

  String formattedDate = DateFormat('dd-MM-yyyy').format(DateTime.now());

  @override
  Future<Either<Failure, SalahTimeDate>> fetchSalahTimeDate() async {
    try {
      var data = await apiService.getTime(
          endPoint: '$formattedDate?country=egypt&city=cairo');
      // log(formattedDate.toString());
      if (data.isNotEmpty) {
        SalahTimeDate salahTimeDate = SalahTimeDate.fromJson(data);
        return right(salahTimeDate);
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

  @override
  Future<Either<Failure, BooksModel>> fetchBooksData() async {
    try {
      var data = await apiService.get(endPoint: 'books/ar/ar/1/25/json');
      if (data.isNotEmpty) {
        BooksModel booksModel = BooksModel.fromJson(data);
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

  @override
  Future<Either<Failure, FatwaModel>> fetchFatwasData() async {
    try {
      var data = await apiService.get(endPoint: 'fatwa/ar/ar/1/25/json');
      if (data.isNotEmpty) {
        FatwaModel fatwaModel = FatwaModel.fromJson(data);
        return right(fatwaModel);
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

  @override
  Future<Either<Failure, KhotabModel>> fetchKhotabsData() async {
    try {
      var data = await apiService.get(endPoint: 'khotab/ar/ar/1/25/json');
      if (data.isNotEmpty) {
        KhotabModel khotabModel = KhotabModel.fromJson(data);
        return right(khotabModel);
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

  @override
  Future<Either<Failure, VideosModel>> fetchVideosData() async {
    try {
      var data = await apiService.get(endPoint: 'videos/ar/ar/1/25/json');
      if (data.isNotEmpty) {
        VideosModel videosModel = VideosModel.fromJson(data);
        return right(videosModel);
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
