import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rawdah/src/common/data/shared_preferences_service.dart';
import 'package:rawdah/src/features/authentication/data/onboarding_provider.dart';
import 'package:rawdah/src/routing/app_router.dart';
import 'package:rawdah/src/themes/app_theme.dart';
import 'package:rawdah/src/utils/app_locale.dart';
import 'package:rawdah/src/utils/app_scroll.dart';
import 'package:rawdah/src/utils/utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // -- Build --
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (ref.read(sharedPreferencesServiceProvider).isOnboardingCompleted()) {
        ref.read(onboardingProvider.notifier).completeOnboarding();
      }
    });

    return MaterialApp.router(
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      restorationScopeId: 'app',
      onGenerateTitle: (BuildContext context) => 'SendNow',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: const [
        // 'en' is the language code. We could optionally provide a
        // a country code as the second param, e.g.
        // Locale('en', 'US'). If we do that, we may want to
        // provide an additional app_en_US.arb file for
        // region-specific translations.
        Locale('kk', ''),
        Locale('ru', ''),
        Locale('en', ''),
        Locale('tr', ''),
      ],
      localeListResolutionCallback: (locales, supportedLocales) {
        final deviceLanguageCodes =
            locales?.map((e) => e.languageCode).toList();
        final appLanguageCodes =
            supportedLocales.map((e) => e.languageCode).toList();

        debugPrint(
            'device = $deviceLanguageCodes. app supporte = $supportedLocales');

        for (Locale locale in locales ?? []) {
          // if device language is supported by the app,
          // just return it to set it as current app language
          if (appLanguageCodes.contains(locale.languageCode)) {
            return locale;
          }
        }

        // if device language is not supported by the app,
        // the app will set it to english but return this to set to Bahasa instead
        return const Locale('en', '');
      },
      locale: ref.watch(appLocaleProvider),
      theme: getAppTheme(Brightness.light),
      darkTheme: getAppTheme(Brightness.dark),
      scrollBehavior: AppScrollBehavior(),
      scaffoldMessengerKey: Utils.messengerKey,
    );
  }
}
