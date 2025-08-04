import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> customUrlLancher({required context, required String? url}) async {
  if (url != null) {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Could not launch $url'),
        ),
      );
    }
  }
}
