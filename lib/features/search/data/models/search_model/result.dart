import 'package:equatable/equatable.dart';

class Result extends Equatable {
  final int? surah;
  final int? verse;

  const Result({this.surah, this.verse});

  factory Result.fromJson(Map<dynamic, dynamic> json) => Result(
        surah: json['surah'] as int?,
        verse: json['verse'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'surah': surah,
        'verse': verse,
      };

  @override
  List<Object?> get props => [surah, verse];
}
