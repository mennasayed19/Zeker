import 'package:equatable/equatable.dart';

class PreparedBy extends Equatable {
  final int? id;
  final int? sourceId;
  final String? title;
  final String? type;
  final String? kind;
  final dynamic description;
  final String? apiUrl;

  const PreparedBy({
    this.id,
    this.sourceId,
    this.title,
    this.type,
    this.kind,
    this.description,
    this.apiUrl,
  });

  factory PreparedBy.fromJson(Map<String, dynamic> json) => PreparedBy(
        id: json['id'] as int?,
        sourceId: json['source_id'] as int?,
        title: json['title'] as String?,
        type: json['type'] as String?,
        kind: json['kind'] as String?,
        description: json['description'] as dynamic,
        apiUrl: json['api_url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'source_id': sourceId,
        'title': title,
        'type': type,
        'kind': kind,
        'description': description,
        'api_url': apiUrl,
      };

  @override
  List<Object?> get props {
    return [
      id,
      sourceId,
      title,
      type,
      kind,
      description,
      apiUrl,
    ];
  }
}
