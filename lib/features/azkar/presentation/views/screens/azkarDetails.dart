import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zeker_app/core/utils/app_colors.dart';
import 'package:zeker_app/core/utils/assets_manager.dart';
import 'package:zeker_app/core/utils/media_query_values.dart';
import 'package:zeker_app/features/azkar/data/models/AzkarModel.dart';
import 'package:zeker_app/features/azkar/presentation/cubits/cubit/azkar_counter_cubit.dart';
import 'package:zeker_app/features/azkar/presentation/cubits/cubit/azkar_counter_state.dart';

class MorningAzkarScreen extends StatefulWidget {
  final List<AzkarModel> azkarList;

  const MorningAzkarScreen({super.key, required this.azkarList});

  @override
  State<MorningAzkarScreen> createState() => _MorningAzkarScreenState();
}

class _MorningAzkarScreenState extends State<MorningAzkarScreen> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AzkarCounterCubit(widget.azkarList),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.azkarList.first.category),
          centerTitle: true,
          backgroundColor: AppColors.primaryColor,
        ),
        body: Stack(
          children: [
            Image.asset(
              AssetsManager.background,
              width: context.width,
              height: context.height,
              fit: BoxFit.cover,
            ),
            BlocBuilder<AzkarCounterCubit, AzkarCounterState>(
              builder: (context, state) {
                return PageView.builder(
                  controller: _pageController,
                  itemCount: widget.azkarList.length,
                  itemBuilder: (context, index) {
                    final zekr = widget.azkarList[index].content;
                    final total =
                        int.tryParse(widget.azkarList[index].count) ?? 1;
                    final remaining = state.counters[index];

                    return Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Card(
                            elevation: 8,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            color: Colors.white.withOpacity(0.60),
                            child: Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Text(
                                zekr,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                width: 80,
                                height: 80,
                                child: CircularProgressIndicator(
                                  value: remaining / total,
                                  strokeWidth: 8,
                                  backgroundColor: Colors.grey.shade300,
                                  valueColor:
                                      const AlwaysStoppedAnimation<Color>(
                                    AppColors.primaryColor,
                                  ),
                                ),
                              ),
                              Text(
                                '$remaining',
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          ElevatedButton(
                            onPressed: () {
                              context
                                  .read<AzkarCounterCubit>()
                                  .decrement(index);

                              if (remaining == 1 &&
                                  index < widget.azkarList.length - 1) {
                                Future.delayed(
                                    const Duration(milliseconds: 300), () {
                                  _pageController.nextPage(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOut,
                                  );
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              backgroundColor: AppColors.primaryColor,
                            ),
                            child: const Icon(
                              Icons.check,
                              size: 40,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              
              },
            ),
          ],
        ),
      ),
    );
  }
}
