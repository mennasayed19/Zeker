import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zeker_app/config/routes/app_routes.dart';
import 'package:zeker_app/core/utils/app_colors.dart';
import 'package:zeker_app/core/utils/style_manger.dart';

class RadioListViewItem extends StatelessWidget {
  const RadioListViewItem({
    super.key,
    required this.title,
    required this.id,
    required this.url,
  });

  final String title;
  final int id;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).push(
            AppRoutes.radioScreen,
            
            extra: {
              'title': title,
              'url': url,
            },
          );

          // customUrlLancher(
          //   context: context,
          //   url: url,
          // );
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 7,
                height: 70,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(width: 20),
              // Main content container
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      id.toString(),
                      style: StyleManger.textStyleBold18.copyWith(fontSize: 16),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      title,
                      style: GoogleFonts.amiri().copyWith(
                        color: AppColors.primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
