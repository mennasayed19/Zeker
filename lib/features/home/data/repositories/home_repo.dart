import 'package:dartz/dartz.dart';
import 'package:zeker_app/core/errors/failure.dart';
import 'package:zeker_app/features/home/data/models/books_model/books_model.dart';
import 'package:zeker_app/features/home/data/models/fatwa_model/fatwa_model.dart';
import 'package:zeker_app/features/home/data/models/khotab_model/khotab_model.dart';
import 'package:zeker_app/features/home/data/models/salah_time_date/salah_time_date.dart';
import 'package:zeker_app/features/home/data/models/videos_model/videos_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, SalahTimeDate>> fetchSalahTimeDate();
  Future<Either<Failure, VideosModel>> fetchVideosData();
  Future<Either<Failure, KhotabModel>> fetchKhotabsData();
  Future<Either<Failure, FatwaModel>> fetchFatwasData();
  Future<Either<Failure, BooksModel>> fetchBooksData();
}
