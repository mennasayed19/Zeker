import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zeker_app/core/utils/app_colors.dart';
import 'package:zeker_app/core/utils/style_manger.dart';
import 'package:zeker_app/features/home/presentation/cubits/home_cubit/home_cubit.dart';

class CategoryListViewBody extends StatelessWidget {
  const CategoryListViewBody({
    super.key,
    required this.category,
  });
  final String category;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<HomeCubit>(context).selectCategory(category: category);
      },
      child: Container(
        alignment: Alignment.center,
        width: 73,
        height: 37,
        margin: EdgeInsets.only(
          top: 11,
        ),
        decoration:
            BlocProvider.of<HomeCubit>(context).selectedCategory == category
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: AppColors.primaryColor,
                  )
                : BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color: AppColors.primaryColor,
                    ),
                    color: AppColors.colorWhite,
                  ),
        child: Text(
          category,
          style: StyleManger.textStyleBold16.copyWith(
            color:
                BlocProvider.of<HomeCubit>(context).selectedCategory == category
                    ? AppColors.colorWhite
                    : AppColors.colorBlack,
          ),
        ),
      ),
    );
  }
}
