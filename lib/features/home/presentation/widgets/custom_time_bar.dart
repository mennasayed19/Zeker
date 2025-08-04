import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zeker_app/core/utils/app_colors.dart';
import 'package:zeker_app/core/utils/assets_manager.dart';
import 'package:zeker_app/core/utils/style_manger.dart';
import 'package:zeker_app/features/home/presentation/cubits/fetch_salah_time_date_cubit/fetch_salah_time_date_cubit.dart';
import 'package:zeker_app/features/home/presentation/widgets/salah_list_view.dart';

class CustomTimeBar extends StatelessWidget {
  const CustomTimeBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchSalahTimeDateCubit, FetchSalahTimeDateState>(
        builder: (context, state) {
      if (state is FetchSalahTimeDateSuccess) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //* Location Text
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Egypt',
                        style: StyleManger.textStyleBold20.copyWith(
                          color: AppColors.colorWhite,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Cairo',
                        style: StyleManger.textStyleBold15.copyWith(
                          color: AppColors.colorWhite,
                        ),
                      ),
                    ],
                  ),
                  //* Notification Icon
                  Image.asset(
                    AssetsManager.notification,
                  ),
                ],
              ),
              SizedBox(
                height: 90,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state.salahTimeDate.data.date!.hijri!.weekday!.en
                        .toString(),
                    style: StyleManger.textStyleBold20.copyWith(
                      color: AppColors.colorWhite,
                    ),
                  ),
                  // SizedBox(width: 10),
                  // Text(
                  //   '4:17 AM',
                  //   style: StyleManger.textStyleBold20.copyWith(
                  //     color: AppColors.colorWhite,
                  //   ),
                  // ),
                ],
              ),
              Text(
                state.salahTimeDate.data.date!.hijri!.holidays.toString(),
                textAlign: TextAlign.center,
                style: StyleManger.textStyleRegular10.copyWith(
                  color: AppColors.colorWhite,
                ),
              ),
              SizedBox(
                height: 31,
              ),
              Container(
                width: 306,
                height: 51,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: AppColors.colorWhite,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // IconButton(
                    //   onPressed: () {},
                    //   icon: Icon(
                    //     Icons.arrow_back_ios_rounded,
                    //     size: 20,
                    //   ),
                    // ),
                    // SizedBox(width: 47),
                    Text(
                      state.salahTimeDate.data.date!.readable.toString(),
                      style: StyleManger.textStyleBold16,
                    ),
                    // SizedBox(width: 47),
                    // IconButton(
                    //   onPressed: () {},
                    //   icon: Icon(
                    //     Icons.arrow_forward_ios_rounded,
                    //     size: 20,
                    //   ),
                    // ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SalahTimeListView(
                timing: state.salahTimeDate.data.timings!,
              ),
            ],
          ),
        );
      } else if (state is FetchSalahTimeDateFailure) {
        return Text(state.errorMessage);
      } else {
        return Center(
            child: CircularProgressIndicator(
          color: AppColors.primaryColor,
        ));
      }
    });
  }
}
