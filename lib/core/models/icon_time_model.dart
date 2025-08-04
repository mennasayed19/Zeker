// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:zeker_app/core/utils/assets_manager.dart';

class IconTimeModel {
  final String image;
  final String title;

  IconTimeModel({
    required this.image,
    required this.title,
  });
}

List<IconTimeModel> iconTimeList = [
  IconTimeModel(
    image: AssetsManager.cloud,
    title: 'Fajr',
  ),
  IconTimeModel(
    image: AssetsManager.sunrise,
    title: 'Sunrise',
  ),
  IconTimeModel(
    image: AssetsManager.cloudyNight,
    title: 'Dhuhr',
  ),
  IconTimeModel(
    image: AssetsManager.cloud,
    title: 'Asr',
  ),
  IconTimeModel(
    image: AssetsManager.sunrise,
    title: 'Maghrib',
  ),
  IconTimeModel(
    image: AssetsManager.cloudyNight,
    title: 'Isha',
  ),
  IconTimeModel(
    image: AssetsManager.cloudyNight,
    title: 'Imsak',
  ),
  IconTimeModel(
    image: AssetsManager.cloudyNight,
    title: 'Midnight',
  ),
];
