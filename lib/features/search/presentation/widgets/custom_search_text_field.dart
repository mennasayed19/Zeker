import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zeker_app/core/utils/app_colors.dart';
import 'package:zeker_app/features/search/presentation/cubit/search_cubit.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (value) {
        if (value.isNotEmpty) {
          List<String> words = [];
          words.add(value.trim());
          BlocProvider.of<SearchCubit>(context).search(words: words);
        } else {
          log("Input is empty");
        }
      },
      decoration: InputDecoration(
        enabledBorder: buildTextborder(),
        focusedBorder: buildTextborder(),
        hintText: 'Search',
        suffixIcon: Icon(Icons.search),
      ),
    );
  }

  OutlineInputBorder buildTextborder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.iconColor,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(12),
    );
  }
}
