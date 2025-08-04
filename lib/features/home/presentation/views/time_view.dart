import 'package:flutter/material.dart';
import 'package:zeker_app/core/utils/app_colors.dart';
import 'package:zeker_app/features/home/presentation/widgets/time_view_body.dart';

class TimeView extends StatelessWidget {
  const TimeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: TimeViewBody(),
    );
  }
}
