import 'package:zeker_app/features/azkar/data/models/AzkarModel.dart';

class CategoryModel {
  final String category;
  final List<AzkarModel> azkar;

  CategoryModel({
    required this.category,
    required this.azkar,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      category: json["category"] ?? "",
      azkar: (json["azkar"] as List)
          .map((item) => AzkarModel.fromJson(item))
          .toList(),
    );
  }
}
