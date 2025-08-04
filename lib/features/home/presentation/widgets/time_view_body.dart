import 'package:flutter/material.dart';
import 'package:zeker_app/core/utils/assets_manager.dart';
import 'package:zeker_app/core/utils/media_query_values.dart';
import 'package:zeker_app/features/home/presentation/widgets/custom_time_bar.dart';

class TimeViewBody extends StatelessWidget {
  const TimeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          //* Background Image
          Image.asset(
            AssetsManager.background,
            width: context.width,
            fit: BoxFit.cover,
          ),
          //* Time Bar
          const CustomTimeBar(),
        ],
      ),
    );
  }
}
