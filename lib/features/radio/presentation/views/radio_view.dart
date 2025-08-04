import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zeker_app/features/radio/presentation/widgets/radio_view_body.dart';

class RadioView extends StatelessWidget {
  const RadioView({super.key});

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      centerTitle: true,
      title: Text(
        'راديو القرآن الكريم',
        style: GoogleFonts.amiri(
          fontSize: 26,
        ),
      ),
      automaticallyImplyLeading: false,
    );
    return Scaffold(
      appBar: appBar,
      body: RadioViewBody(),
    );
  }
}
