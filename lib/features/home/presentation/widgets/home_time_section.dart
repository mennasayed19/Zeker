import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zeker_app/config/routes/app_routes.dart';
import 'package:zeker_app/core/utils/app_colors.dart';
import 'package:zeker_app/core/utils/app_strings.dart';
import 'package:zeker_app/core/utils/assets_manager.dart';
import 'package:zeker_app/core/utils/style_manger.dart';
import 'package:zeker_app/features/home/presentation/cubits/fetch_salah_time_date_cubit/fetch_salah_time_date_cubit.dart';
import 'dart:async'; // Import for Timer

class HomeTimeSection extends StatefulWidget {
  const HomeTimeSection({
    super.key,
  });

  @override
  State<HomeTimeSection> createState() => _HomeTimeSectionState();
}

class _HomeTimeSectionState extends State<HomeTimeSection> {
  String _currentTime = '';
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _updateTime();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateTime();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  // Method to update the current time
  void _updateTime() {
    setState(() {
      _currentTime = _formatTime(DateTime.now());
    });
  }

  String _formatTime(DateTime dateTime) {
    return '${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            BlocBuilder<FetchSalahTimeDateCubit, FetchSalahTimeDateState>(
              builder: (context, state) {
                if (state is FetchSalahTimeDateFailure) {
                  return Flexible(
                    child: Text(state.errorMessage),
                  );
                } else if (state is FetchSalahTimeDateSuccess) {
                  return Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.zeker,
                          style: StyleManger.textStyleBold30,
                        ),
                        Text(
                          _currentTime, // Display the current time
                          style: StyleManger.textStyleBold36,
                        ),
                        Row(
                          children: [
                            Text(
                              state.salahTimeDate.data.date!.hijri!.month!.en
                                  .toString(),
                              style: StyleManger.textStyleBold10,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(
                              '${state.salahTimeDate.data.date!.hijri!.day},',
                              style: StyleManger.textStyleBold10,
                            ),
                            Text(
                              state.salahTimeDate.data.date!.hijri!.year
                                  .toString(),
                              style: StyleManger.textStyleBold10,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              state.salahTimeDate.data.date!.hijri!.designation!
                                  .abbreviated
                                  .toString(),
                              style: StyleManger.textStyleBold10,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 11,
                        ),
                        GestureDetector(
                          onTap: () {
                            GoRouter.of(context).push(AppRoutes.timeView);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 117,
                            height: 29,
                            decoration: BoxDecoration(
                              color: AppColors.iconColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'مواعيد الصلاه',
                              style: StyleManger.textStyleBold15.copyWith(
                                color: AppColors.colorWhite,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            Expanded(
              child: Image.asset(
                AssetsManager.duaa,
                // height: 196,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
