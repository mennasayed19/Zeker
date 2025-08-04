import 'package:equatable/equatable.dart';

import 'radio.dart';

class RadioModel extends Equatable {
  final List<Radio>? radios;

  const RadioModel({this.radios});

  factory RadioModel.fromJson(Map<String, dynamic> json) => RadioModel(
        radios: (json['radios'] as List<dynamic>?)
            ?.map((e) => Radio.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'radios': radios?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [radios];
}
