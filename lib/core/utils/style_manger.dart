import 'package:flutter/material.dart';
import 'package:zeker_app/core/utils/app_colors.dart';
import 'package:zeker_app/core/utils/font_manager.dart';

abstract class StyleManger {
  //! 10
  static const textStyleBold10 = TextStyle(
    fontSize: 10,
    // fontFamily: FontConstants.poppins,
    fontWeight: FontWeightManager.bold,
  );
  static const textStyleRegular10 = TextStyle(
    fontSize: 10,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeightManager.regular,
  );

  //! 12
  static const textStyleMedium12 = TextStyle(
    fontSize: 12,
    // fontFamily: FontConstants.poppins,
    fontWeight: FontWeightManager.medium,
  );

  //! 13
  static const textStyleMedium13 = TextStyle(
    fontSize: 13,
    // fontFamily: FontConstants.poppins,
    fontWeight: FontWeightManager.bold,
  );

  //! 14
  static const textStyleMedium14 = TextStyle(
    fontSize: 14,
    // fontFamily: FontConstants.poppins,
    fontWeight: FontWeightManager.medium,
  );

  //! 15
  static const textStyleRegular15 = TextStyle(
    fontSize: 15,
    // fontFamily: FontConstants.poppins,
    fontWeight: FontWeightManager.regular,
  );
  static const textStyleBold15 = TextStyle(
    fontSize: 15,
    // fontFamily: FontConstants.poppins,
    fontWeight: FontWeightManager.bold,
  );

  //! 16
  static const textStyleRegular16 = TextStyle(
    fontSize: 16,
    // fontFamily: FontConstants.poppins,
    fontWeight: FontWeightManager.regular,
  );
  static const textStyleMedium16 = TextStyle(
    fontSize: 16,
    // fontFamily: FontConstants.poppins,
    fontWeight: FontWeightManager.medium,
  );
  static const textStyleBold16 = TextStyle(
    fontSize: 16,
    // fontFamily: FontConstants.poppins,
    fontWeight: FontWeightManager.bold,
  );

  //! 18
  static const textStyleBold18 = TextStyle(
    fontSize: 18,
    // fontFamily: FontConstants.poppins,
    fontWeight: FontWeightManager.bold,
  );

  //! 20
  static const textStyleBold20 = TextStyle(
    fontSize: FontSize.s20,
    // fontFamily: FontConstants.poppins,
    fontWeight: FontWeightManager.bold,
  );

  //! 24
  static const textStyleBold24 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeightManager.bold,
    color: AppColors.primaryColor,
  );
  //! 30
  static const textStyleBold30 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeightManager.bold,
    color: AppColors.primaryColor,
  );

  //! 36
  static const textStyleBold36 = TextStyle(
    fontSize: 36,
    // fontFamily: FontConstants.poppins,
    fontWeight: FontWeightManager.bold,
  );
}
