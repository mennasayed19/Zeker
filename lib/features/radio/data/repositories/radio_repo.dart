import 'package:dartz/dartz.dart';
import 'package:zeker_app/core/errors/failure.dart';
import 'package:zeker_app/features/radio/data/models/radio_model/radio_model.dart';

abstract class RadioRepo {
  Future<Either<Failure, RadioModel>> fetchRadioData();
}
