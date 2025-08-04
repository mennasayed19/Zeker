import 'package:equatable/equatable.dart';

import 'designation.dart';
import 'month.dart';
import 'weekday.dart';

class Hijri extends Equatable {
  final String? date;
  final String? format;
  final String? day;
  final Weekday? weekday;
  final Month? month;
  final String? year;
  final Designation? designation;
  final List<dynamic>? holidays;
  final List<dynamic>? adjustedHolidays;
  final String? method;

  const Hijri({
    this.date,
    this.format,
    this.day,
    this.weekday,
    this.month,
    this.year,
    this.designation,
    this.holidays,
    this.adjustedHolidays,
    this.method,
  });

  factory Hijri.fromJson(Map<String, dynamic> json) => Hijri(
        date: json['date'] as String?,
        format: json['format'] as String?,
        day: json['day'] as String?,
        weekday: json['weekday'] == null
            ? null
            : Weekday.fromJson(json['weekday'] as Map<String, dynamic>),
        month: json['month'] == null
            ? null
            : Month.fromJson(json['month'] as Map<String, dynamic>),
        year: json['year'] as String?,
        designation: json['designation'] == null
            ? null
            : Designation.fromJson(json['designation'] as Map<String, dynamic>),
        holidays: json['holidays'] as List<dynamic>?,
        adjustedHolidays: json['adjustedHolidays'] as List<dynamic>?,
        method: json['method'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'date': date,
        'format': format,
        'day': day,
        'weekday': weekday?.toJson(),
        'month': month?.toJson(),
        'year': year,
        'designation': designation?.toJson(),
        'holidays': holidays,
        'adjustedHolidays': adjustedHolidays,
        'method': method,
      };

  @override
  List<Object?> get props {
    return [
      date,
      format,
      day,
      weekday,
      month,
      year,
      designation,
      holidays,
      adjustedHolidays,
      method,
    ];
  }
}
