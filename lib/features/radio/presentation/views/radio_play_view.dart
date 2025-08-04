import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zeker_app/core/utils/app_colors.dart';
import 'package:zeker_app/features/radio/presentation/cubit/radio_cubit/radio_cubit.dart';

class RadioPlayView extends StatelessWidget {
  const RadioPlayView({super.key, required this.url, required this.title});
  final String url;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'راديو القرآن الكريم',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.colorWhite,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 104, 101, 244),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 104, 101, 244),
              AppColors.primaryColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.colorWhite,
                ),
              ),
              SizedBox(height: 30),
              BlocBuilder<RadioCubit, RadioState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      IconButton(
                        icon: Icon(
                          state is RadioPlaying
                              ? Icons.pause_circle_filled
                              : Icons.play_circle_filled,
                          size: 80,
                          color: AppColors.colorWhite,
                        ),
                        onPressed: () {
                          context.read<RadioCubit>().togglePlay(url);
                        },
                      ),
                      SizedBox(height: 20),
                      if (state is RadioPlaying)
                        Text(
                          'جاري التشغيل...',
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColors.colorWhite,
                          ),
                        ),
                      if (state is RadioPaused)
                        Text(
                          'متوقف مؤقتًا',
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColors.colorWhite,
                          ),
                        ),
                    ],
                  );
                },
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<RadioCubit>(context).stop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'إيقاف',
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.colorWhite,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
