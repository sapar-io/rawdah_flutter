import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ZikrsScreen extends ConsumerStatefulWidget {
  const ZikrsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ZikrsScreenState();
}

class _ZikrsScreenState extends ConsumerState<ZikrsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.tabs_zikrs),
      ),
      body: Container(
        child: Center(
          child: Text(
            AppLocalizations.of(context)!.zikrs_first_text,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
