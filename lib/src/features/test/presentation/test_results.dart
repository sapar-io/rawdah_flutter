import 'package:flutter/material.dart';
import 'package:rawdah/src/common/presentation/primary_button.dart';
import 'package:rawdah/src/constants/app_sizes.dart';
import 'package:rawdah/src/features/names/data/names_repository.dart';
import 'package:rawdah/src/themes/text_color.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TestResultsScreen extends StatelessWidget {
  const TestResultsScreen({
    super.key,
    required this.topic,
    required this.correctCounter,
    required this.mistakeCounter,
    required this.callback,
  });

  // -- Variables --
  final int topic;
  final int correctCounter;
  final int mistakeCounter;
  final VoidCallback callback;

  // -- Methods --
  int _leftNames() {
    return 99 - ((topic + 1) * 9);
  }

  // -- Build --
  @override
  Widget build(BuildContext context) {
    if (mistakeCounter == 0) {
      return _success(context);
    }
    return _failure(context);
  }

  // -- Widget --
  Widget _success(BuildContext context) {
    final ids = NamesRepository.getTopicNamesIDs(topic);
    return Container(
      color: Colors.black.withOpacity(0.4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: Sizes.p32,
              vertical: Sizes.p64,
            ),
            padding: const EdgeInsets.all(Sizes.p16),
            decoration: BoxDecoration(
              color: scaffoldBackground(context),
              borderRadius: BorderRadius.circular(Sizes.p24),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppLocalizations.of(context)!.test_success_first_text,
                  textAlign: TextAlign.center,
                ),
                gapH12,
                Text(
                  AppLocalizations.of(context)!
                      .test_success_second_text('${ids.first}-${ids.last}'),
                  textAlign: TextAlign.center,
                ),
                gapH24,
                Text(
                  AppLocalizations.of(context)!
                      .test_success_third_text(_leftNames()),
                  textAlign: TextAlign.center,
                ),
                gapH32,
                PrimaryButton(
                  text: AppLocalizations.of(context)!.test_success_next_button,
                  onPressed: callback,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _failure(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: Sizes.p32,
              vertical: Sizes.p64,
            ),
            padding: const EdgeInsets.all(Sizes.p16),
            decoration: BoxDecoration(
              color: scaffoldBackground(context),
              borderRadius: BorderRadius.circular(Sizes.p24),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "${AppLocalizations.of(context)!.test_error_correct} $correctCounter",
                  textAlign: TextAlign.center,
                ),
                gapH12,
                Text(
                  "${AppLocalizations.of(context)!.test_error_mistake} $mistakeCounter",
                  textAlign: TextAlign.center,
                ),
                gapH24,
                Text(
                  AppLocalizations.of(context)!.test_error_first_text,
                  textAlign: TextAlign.center,
                ),
                gapH12,
                Text(
                  AppLocalizations.of(context)!.test_error_second_text,
                  textAlign: TextAlign.center,
                ),
                gapH32,
                PrimaryButton(
                  text: AppLocalizations.of(context)!.test_error_button,
                  onPressed: callback,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
