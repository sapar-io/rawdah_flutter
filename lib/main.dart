import 'dart:async';

import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:rawdah/firebase_options.dart';
import 'package:rawdah/src/common/data/shared_preferences_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';

import 'src/app.dart';

void main() async {
  // * For more info on error handling, see:
  // * https://docs.flutter.dev/testing/errors
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    // * Убераем # в URL-адресах при открытии через браузер
    usePathUrlStrategy();

    // * Entry point of the app
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // * Активация AppCheck для браузеров
    await FirebaseAppCheck.instance.activate(
      webRecaptchaSiteKey: 'recaptcha-v3-site-key',
      androidProvider: AndroidProvider.playIntegrity,
    );

    // * Служба общих настроек - локальные данные
    final sharedPreferences = await SharedPreferences.getInstance();

    await Hive.initFlutter();
    await Hive.openBox('learned_names');
    await Hive.openBox('learned_topics');

    runApp(
      ProviderScope(
        overrides: [
          sharedPreferencesServiceProvider.overrideWithValue(
            SharedPreferencesService(sharedPreferences),
          )
        ],
        child: const MyApp(),
      ),
    );

    // * This code will present some error UI if any uncaught exception happens
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
    };
    ErrorWidget.builder = (FlutterErrorDetails details) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text('An error occurred'),
        ),
        body: Center(child: Text(details.toString())),
      );
    };
  }, (Object error, StackTrace stack) {
    // * Log any errors to console
    debugPrint(error.toString());
  });
}
