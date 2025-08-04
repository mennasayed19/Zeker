import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:zeker_app/core/api/api_service.dart';
import 'package:zeker_app/features/home/data/repositories/home_repo_impl.dart';
import 'package:zeker_app/features/radio/data/repositories/radio_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  //* ApiServer
  getIt.registerSingleton<ApiService>(ApiService(Dio()));

  //* Home Repo
  getIt.registerSingleton<HomeRepoImpl>(
      HomeRepoImpl(apiService: getIt.get<ApiService>()));

  //* Radio Repo
  getIt.registerSingleton<RadioRepoImpl>(
      RadioRepoImpl(apiService: getIt.get<ApiService>()));
}
