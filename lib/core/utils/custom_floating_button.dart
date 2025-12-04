import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:go_router/go_router.dart';
import 'package:zeker_app/config/routes/app_routes.dart';
import 'package:zeker_app/core/utils/app_colors.dart';

class CustomFloationButton extends StatelessWidget {
  const CustomFloationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ExpandableFab(
      openButtonBuilder: FloatingActionButtonBuilder(
        size: 20,
        builder: (context, onPressed, progress) {
          return Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: AppColors.primaryColor,
            ),
            child: Icon(
              Icons.menu_outlined,
              color: AppColors.colorWhite,
            ),
          );
        },
      ),
      children: [
        FloatingActionButton.small(
          heroTag: null,
          backgroundColor: AppColors.primaryColor,
          child: const Icon(
            Icons.radio_sharp,
            color: AppColors.colorWhite,
          ),
          onPressed: () {
            GoRouter.of(context).push(AppRoutes.radioView);
          },
        ),
        FloatingActionButton.small(
          heroTag: null,
          backgroundColor: AppColors.primaryColor,
          child: Image.asset(
            'assets/icons/night.png',
            width: 26,
            height: 26,
          ),
          onPressed: () {
            GoRouter.of(context).push(AppRoutes.azkarScreen);
          },
        ),
        FloatingActionButton.small(
          backgroundColor: AppColors.primaryColor,
          heroTag: null,
          child: const Icon(
            Icons.search_outlined,
            color: AppColors.colorWhite,
          ),
          onPressed: () {
            GoRouter.of(context).push(AppRoutes.searchView);
          },
        ),
      ],
    );
  }
}
