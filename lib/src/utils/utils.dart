import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static var messengerKey = GlobalKey<ScaffoldMessengerState>();

  static showSnackBar(String? text) {
    if (text == null) return;

    final snackBar = SnackBar(
      content: Text(text),
      backgroundColor: Colors.red,
    );

    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static void openLink(String link) async {
    if (await canLaunchUrl(Uri.parse(link))) {
      await launchUrl(Uri.parse(link));
    } else {
      Utils.showSnackBar("link can not open $link");
    }
  }

  static void openPhoneNumber(String link) async {
    final uri = Uri(scheme: "tel", path: link);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      Utils.showSnackBar("link can not open $link");
    }
  }

  static void openMailTo(String link) async {
    final uri = Uri(scheme: "mailto", path: link);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      Utils.showSnackBar("link can not open $link");
    }
  }
}
