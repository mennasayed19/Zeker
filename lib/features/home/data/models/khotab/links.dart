import 'package:equatable/equatable.dart';

class Links extends Equatable {
  final String? next;
  final String? prev;
  final String? first;
  final String? last;
  final int? currentPage;
  final int? pagesNumber;
  final int? totalItems;

  const Links({
    this.next,
    this.prev,
    this.first,
    this.last,
    this.currentPage,
    this.pagesNumber,
    this.totalItems,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        next: json['next'] as String?,
        prev: json['prev'] as String?,
        first: json['first'] as String?,
        last: json['last'] as String?,
        currentPage: json['current_page'] as int?,
        pagesNumber: json['pages_number'] as int?,
        totalItems: json['total_items'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'next': next,
        'prev': prev,
        'first': first,
        'last': last,
        'current_page': currentPage,
        'pages_number': pagesNumber,
        'total_items': totalItems,
      };

  @override
  List<Object?> get props {
    return [
      next,
      prev,
      first,
      last,
      currentPage,
      pagesNumber,
      totalItems,
    ];
  }
}
