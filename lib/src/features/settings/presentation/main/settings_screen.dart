import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rawdah/src/constants/app_icons.dart';
import 'package:rawdah/src/constants/app_sizes.dart';
import 'package:rawdah/src/themes/text_color.dart';
import 'package:rawdah/src/utils/app_locale.dart';
import 'package:rawdah/src/utils/utils.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

enum SettingsButtonType {
  top,
  normal,
  all,
  bottom,
}

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  // -- Methods --
  _share() async {
    Share.share('https://rawdah.me');
  }

  _review() {
    if (Platform.isAndroid || Platform.isIOS) {
      final appId =
          Platform.isAndroid ? 'YOUR_ANDROID_PACKAGE_ID' : 'id1626704913';
      final url = Uri.parse(
        Platform.isAndroid
            ? "market://details?id=$appId"
            : "https://apps.apple.com/app/id$appId",
      );
      launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  _changeLanguage(WidgetRef ref, String locale) {
    if (locale == 'system') {
      ref.read(appLocaleProvider.notifier).set(null);
      return;
    }
    ref.read(appLocaleProvider.notifier).set(Locale(locale, ''));
  }

  // -- Build --
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settings_title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          top: Sizes.p16,
          left: Sizes.p16,
          right: Sizes.p16,
          bottom: Sizes.p64,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _title(
              context,
              AppLocalizations.of(context)!.settings_languages,
            ),
            gapH4,
            _button(
              context: context,
              title: '🇰🇿 Қазақша',
              icon: null,
              type: SettingsButtonType.top,
              callback: () => _changeLanguage(ref, 'kk'),
            ),
            const Divider(height: 1),
            _button(
              context: context,
              title: '🇷🇺 Русский',
              icon: null,
              callback: () => _changeLanguage(ref, 'ru'),
            ),
            const Divider(height: 1),
            _button(
              context: context,
              title: '🇬🇧 English',
              icon: null,
              callback: () => _changeLanguage(ref, 'en'),
            ),
            const Divider(height: 1),
            _button(
              context: context,
              title: '🇹🇷 Turkçe',
              icon: null,
              callback: () => _changeLanguage(ref, 'tr'),
            ),
            const Divider(height: 1),
            _button(
              context: context,
              title: '📱 Системный',
              icon: null,
              type: SettingsButtonType.bottom,
              callback: () => _changeLanguage(ref, 'system'),
            ),
            gapH24,
            _title(
              context,
              AppLocalizations.of(context)!.donate_title,
            ),
            gapH4,
            // _button(
            //   context: context,
            //   title: AppLocalizations.of(context)?.donate_button,
            //   icon: AppIcons.heart.assetName,
            //   type: SettingsButtonType.top,
            //   callback: () {},
            // ),
            // const Divider(height: 1),
            _button(
              context: context,
              title: AppLocalizations.of(context)!.settings_rate,
              icon: AppIcons.star.assetName,
              type: SettingsButtonType.top,
              callback: _review,
            ),
            const Divider(height: 1),
            _button(
              context: context,
              title: AppLocalizations.of(context)!.settings_share,
              icon: AppIcons.share.assetName,
              type: SettingsButtonType.bottom,
              callback: _share,
            ),
            gapH24,
            _title(
              context,
              AppLocalizations.of(context)!.settings_messengers,
            ),
            gapH4,
            _button(
              context: context,
              title: 'Telegram',
              icon: AppIcons.message.assetName,
              type: SettingsButtonType.top,
              callback: () => Utils.openLink('https://t.me/saparfriday'),
            ),
            const Divider(height: 1),
            _button(
              context: context,
              title: 'WhatsApp',
              icon: AppIcons.message.assetName,
              type: SettingsButtonType.bottom,
              callback: () => Utils.openLink('https://wa.me/77477773404'),
            ),
            gapH24,
            _title(
              context,
              AppLocalizations.of(context)!.settings_others,
            ),
            gapH4,
            _button(
              context: context,
              title: 'Instagram',
              icon: AppIcons.camera.assetName,
              type: SettingsButtonType.all,
              callback: () =>
                  Utils.openLink('https://www.instagram.com/rawdah.app'),
            ),
            gapH24,
            _title(
              context,
              AppLocalizations.of(context)!.settings_support,
            ),
            gapH4,
            _button(
              context: context,
              title: AppLocalizations.of(context)!.settings_website,
              icon: AppIcons.website.assetName,
              type: SettingsButtonType.top,
              callback: () => Utils.openLink('https://rawdah.me'),
            ),
            const Divider(height: 1),
            _button(
              context: context,
              title: 'saparfriday@proton.me',
              icon: AppIcons.mail.assetName,
              callback: () => Utils.openMailTo('saparfriday@proton.me'),
            ),
            const Divider(height: 1),
            _button(
              context: context,
              title: AppLocalizations.of(context)!.settings_policy,
              icon: AppIcons.confidentional.assetName,
              callback: () =>
                  Utils.openLink('https://rawdah.me/privacy-policy.html'),
            ),
            const Divider(height: 1),
            _button(
              context: context,
              title: AppLocalizations.of(context)!.settings_agreement,
              icon: AppIcons.terms.assetName,
              type: SettingsButtonType.bottom,
              callback: () =>
                  Utils.openLink('https://rawdah.me/terms-page.html'),
            ),
          ],
        ),
      ),
    );
  }

  // -- Build --
  Widget _title(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.p8),
      child: Text(
        title,
        style: TextStyle(color: secondaryText(context)),
      ),
    );
  }

  Widget _button({
    required BuildContext context,
    required String title,
    required String? icon,
    required VoidCallback callback,
    SettingsButtonType type = SettingsButtonType.normal,
  }) {
    return InkWell(
      onTap: callback,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.p16,
          vertical: Sizes.p12,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
                type == SettingsButtonType.top || type == SettingsButtonType.all
                    ? Sizes.p8
                    : 0),
            topRight: Radius.circular(
                type == SettingsButtonType.top || type == SettingsButtonType.all
                    ? Sizes.p8
                    : 0),
            bottomLeft: Radius.circular(type == SettingsButtonType.bottom ||
                    type == SettingsButtonType.all
                ? Sizes.p8
                : 0),
            bottomRight: Radius.circular(type == SettingsButtonType.bottom ||
                    type == SettingsButtonType.all
                ? Sizes.p8
                : 0),
          ),
        ),
        child: Row(
          children: [
            icon == null
                ? Container()
                : SvgPicture.asset(
                    icon,
                    color: primary(context),
                  ),
            icon == null ? Container() : gapW12,
            Text(title),
          ],
        ),
      ),
    );
  }
}
