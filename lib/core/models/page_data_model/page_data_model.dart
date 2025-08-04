import 'package:equatable/equatable.dart';

class PageDataModel extends Equatable {
  final int? surah;
  final int? start;
  final int? end;

  const PageDataModel({this.surah, this.start, this.end});

  factory PageDataModel.fromJson(Map<String, dynamic> json) => PageDataModel(
        surah: json['surah'] as int?,
        start: json['start'] as int?,
        end: json['end'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'surah': surah,
        'start': start,
        'end': end,
      };

  @override
  List<Object?> get props => [surah, start, end];
}
