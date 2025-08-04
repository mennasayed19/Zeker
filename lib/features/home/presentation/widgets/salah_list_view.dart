import 'package:flutter/material.dart';
import 'package:zeker_app/core/models/icon_time_model.dart';
import 'package:zeker_app/features/home/data/models/salah_time_date/timings.dart';
import 'package:zeker_app/features/home/presentation/widgets/salah_time_list_view_item.dart';

class SalahTimeListView extends StatelessWidget {
  const SalahTimeListView({
    super.key,
    required this.timing,
  });

  final Timings timing;

  @override
  Widget build(BuildContext context) {
    final List<String?> times = [
      timing.fajr,
      timing.sunrise,
      timing.dhuhr,
      timing.asr,
      timing.maghrib,
      timing.isha,
      timing.imsak,
    ];

    return Expanded(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: times.length,
        itemBuilder: (context, index) {
          return SalahTimeListViewitem(
            image: iconTimeList[index].image,
            title: iconTimeList[index].title,
            time: times[index] ?? 'N/A',
          );
        },
      ),
    );
  }
}
