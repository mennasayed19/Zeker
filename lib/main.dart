
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zeker_app/config/routes/app_routes.dart';
import 'package:zeker_app/config/themes/light_theme.dart';
import 'package:zeker_app/core/utils/service_locator.dart';
import 'package:zeker_app/features/home/data/repositories/home_repo_impl.dart';
import 'package:zeker_app/features/home/presentation/cubits/fetch_salah_time_date_cubit/fetch_salah_time_date_cubit.dart';
import 'package:zeker_app/features/home/presentation/cubits/home_cubit/home_cubit.dart';
// import 'package:quran/quran.dart' as quran;

void main() {
  setupServiceLocator();
  // log(quran.getPageData(5).toString());
  runApp(const ZekerApp());
}

class ZekerApp extends StatelessWidget {
  const ZekerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => FetchSalahTimeDateCubit(
            getIt.get<HomeRepoImpl>(),
          )..fetchSalahTimeDate(),
        ),
        BlocProvider(
          create: (_) => HomeCubit(
            getIt.get<HomeRepoImpl>(),
          )..selectCategory(
              category: "سور القرآن",
            ),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: lightTheme(),
        routerConfig: AppRoutes.router,
      ),
    );
  }
}
