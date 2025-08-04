import 'package:flutter/material.dart';

import 'package:zeker_app/core/utils/app_colors.dart';
import 'package:zeker_app/core/utils/style_manger.dart';

class SalahTimeListViewitem extends StatelessWidget {
  const SalahTimeListViewitem({
    super.key,
    required this.image,
    required this.title,
    required this.time,
  });
  final String image;
  final String title;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(image),
          Text(
            title,
            style: StyleManger.textStyleMedium13.copyWith(
              color: AppColors.colorWhite,
            ),
          ),
          Text(
            time,
            style: StyleManger.textStyleMedium13.copyWith(
              color: AppColors.colorWhite,
            ),
          ),
        ],
      ),
    );
  }
}
