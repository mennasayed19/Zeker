import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:zeker_app/core/utils/assets_manager.dart';
import 'package:zeker_app/core/utils/media_query_values.dart';
import 'package:zeker_app/core/notification_service/notification_service.dart';
import 'package:zeker_app/features/azkar/presentation/cubits/cubit/azkar_cubit.dart';
import 'package:zeker_app/features/azkar/presentation/cubits/cubit/azkar_state.dart';
import 'package:zeker_app/features/azkar/presentation/views/widgets/zeker_item.dart';

class AzkarScreen extends StatelessWidget {
  const AzkarScreen({super.key});

  static const List<String> azkarIcon = [
    'assets/icons/night.png',
    'assets/icons/salah.png',
    'assets/icons/sleap.png',
    'assets/icons/home.png',
    'assets/icons/khatm.png',
    'assets/icons/air.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => AzkarCubit()..fetchAzkar(),
        child: Stack(
          children: [
            Image.asset(
              AssetsManager.background,
              width: context.width,
              height: context.height,
              fit: BoxFit.cover,
            ),
            BlocBuilder<AzkarCubit, AzkarState>(
              builder: (context, state) {
                if (state is AzkarLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is AzkarSucces) {
                  final azkarList = state.azkarList;
                  log('Azkar List Length: ${azkarList.length}');
                  //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!//
                  // NotificationService.scheduleDailyAzkar();
                  // log('Scheduled Azkar Notifications');
                  final categories =
                      azkarList.map((e) => e.category).toSet().toList();

                  return Column(
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        "الأذكار",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: ListView.separated(
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          itemCount: categories.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 12),
                          itemBuilder: (context, index) {
                            final filteredAzkar = azkarList
                                .where((azkar) =>
                                    azkar.category == categories[index])
                                .toSet()
                                .toList();

                            return AzkarItem(
                              category: categories[index],
                              azkarList: filteredAzkar,
                            );
                          },
                        ),
                      ),
                    ],
                  );
                } else if (state is AzkarError) {
                  return Center(child: Text(state.message));
                }

                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
