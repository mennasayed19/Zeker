import 'package:equatable/equatable.dart';

import 'result.dart';

class SearchModel extends Equatable {
  final int? occurences;
  final List<Result>? result;

  const SearchModel({this.occurences, this.result});

  factory SearchModel.fromJson(Map<dynamic, dynamic> json) => SearchModel(
        occurences: json['occurences'] as int?,
        result: (json['result'] as List<dynamic>?)
            ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'occurences': occurences,
        'result': result?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [occurences, result];
}
