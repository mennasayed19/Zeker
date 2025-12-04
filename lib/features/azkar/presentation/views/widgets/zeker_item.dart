import 'package:flutter/material.dart';
import 'package:zeker_app/features/azkar/data/models/AzkarModel.dart';
import 'package:zeker_app/features/azkar/presentation/views/screens/azkarDetails.dart';

class AzkarItem extends StatelessWidget {
  final String category;
  final List<AzkarModel> azkarList;

  const AzkarItem({
    super.key,
    required this.category,
    required this.azkarList,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final filteredAzkar =
            azkarList.where((azkar) => azkar.category == category).toList();

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MorningAzkarScreen(azkarList: filteredAzkar),
          ),
        );
      },
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Colors.white.withOpacity(0.65),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            category,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ),
      ),
    );
  }
}
