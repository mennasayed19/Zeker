import 'package:equatable/equatable.dart';

import 'data.dart';

class SalahTimeDate extends Equatable {
  final int code;
  final String status;
  final Data data;

  const SalahTimeDate({
    required this.code,
    required this.status,
    required this.data,
  });

  factory SalahTimeDate.fromJson(Map<String, dynamic> json) => SalahTimeDate(
        code: json['code'] as int,
        status: json['status'] as String,
        data: Data.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'status': status,
        'data': data.toJson(),
      };

  @override
  List<Object?> get props => [code, status, data];
}
