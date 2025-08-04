import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zeker_app/core/utils/service_locator.dart';
import 'package:zeker_app/features/home/presentation/views/home_view.dart';
import 'package:zeker_app/features/radio/data/repositories/radio_repo_impl.dart';
import 'package:zeker_app/features/radio/presentation/cubit/fetch_radio_data/fetch_radio_data_cubit.dart';
import 'package:zeker_app/features/radio/presentation/cubit/radio_cubit/radio_cubit.dart';
import 'package:zeker_app/features/radio/presentation/views/radio_view.dart';
import 'package:zeker_app/features/home/presentation/views/time_view.dart';
import 'package:zeker_app/features/radio/presentation/views/radio_play_view.dart';
import 'package:zeker_app/features/search/presentation/cubit/search_cubit.dart';
import 'package:zeker_app/features/search/presentation/views/search_view.dart';
import 'package:zeker_app/features/splash/presentation/views/splash_view.dart';
import 'package:zeker_app/features/surah/presentation/views/surah_view.dart';

abstract class AppRoutes {
  static const splashView = '/';
  static const homeView = '/homeView';
  static const surahView = '/surahView';
  static const timeView = '/timeView';
  static const searchView = '/searchView';
  static const radioView = '/radioView';
  static const radioScreen = '/radioScreen';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: splashView,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: homeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: timeView,
        builder: (context, state) => const TimeView(),
      ),
      GoRoute(
          path: radioScreen,
          builder: (context, state) {
            final Map<String, dynamic> extraData =
                state.extra as Map<String, dynamic>;
            final String title = extraData['title'];
            final String url = extraData['url'];
            return BlocProvider(
              create: (context) => RadioCubit(),
              child: RadioPlayView(
                url: url,
                title: title,
              ),
            );
          }),
      GoRoute(
        path: radioView,
        builder: (context, state) => BlocProvider(
          create: (context) => FetchRadioDataCubit(
            getIt.get<RadioRepoImpl>(),
          )..fetchRadioData(),
          child: const RadioView(),
        ),
      ),
      GoRoute(
        path: searchView,
        builder: (context, state) => BlocProvider(
          create: (context) => SearchCubit(),
          child: const SearchView(),
        ),
      ),
      GoRoute(
        path: surahView,
        builder: (context, state) {
          final surahIndex = state.extra as int;
          return SurahView(
            surahNumber: surahIndex,
          );
        },
      ),
    ],
  );
}
