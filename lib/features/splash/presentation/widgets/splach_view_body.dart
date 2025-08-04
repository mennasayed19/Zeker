import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zeker_app/config/routes/app_routes.dart';
import 'package:zeker_app/core/utils/app_colors.dart';
import 'package:zeker_app/core/utils/app_strings.dart';
import 'package:zeker_app/core/utils/assets_manager.dart';
import 'package:zeker_app/core/utils/style_manger.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    goNext();
  }

  Future<void> goNext() {
    return Future.delayed(
      Duration(seconds: 3),
      () {
        GoRouter.of(context).pushReplacement(AppRoutes.homeView);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          height: 195,
          AssetsManager.zekerLogo,
        ),
        Center(
          child: Text(
            AppStrings.zeker,
            style: StyleManger.textStyleBold36.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ),
        // SizedBox(
        //   height: 40,
        // ),
        // Align(
        //   child: AnimatedTextKit(
        //     pause: Duration(seconds: 3),
        //     totalRepeatCount: 1,
        //     animatedTexts: [
        //       TypewriterAnimatedText(
        //         AppStrings.readQuranEasy,
        //         speed: const Duration(milliseconds: 100),
        //         textStyle: StyleManger.textStyleBold24,
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
