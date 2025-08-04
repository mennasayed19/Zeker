import 'package:equatable/equatable.dart';

class Month extends Equatable {
  final int? number;
  final String? en;
  final String? ar;
  final int? days;

  const Month({this.number, this.en, this.ar, this.days});

  factory Month.fromJson(Map<String, dynamic> json) => Month(
        number: json['number'] as int?,
        en: json['en'] as String?,
        ar: json['ar'] as String?,
        days: json['days'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'number': number,
        'en': en,
        'ar': ar,
        'days': days,
      };

  @override
  List<Object?> get props => [number, en, ar, days];
}
