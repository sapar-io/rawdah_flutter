import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rawdah/src/constants/app_icons.dart';
import 'package:rawdah/src/features/dashboard/domain/dashboard_view_model.dart';
import 'package:rawdah/src/constants/app_sizes.dart';
import 'package:rawdah/src/features/map/presentation/map_screen.dart';
import 'package:rawdah/src/features/names/presentation/home/names_screen.dart';
import 'package:rawdah/src/features/zirks/presentation/zikrs_screen.dart';
import 'package:rawdah/src/themes/text_color.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NavbarScreen extends ConsumerStatefulWidget {
  const NavbarScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NavbarScreenState();
}

class _NavbarScreenState extends ConsumerState<NavbarScreen> {
  // -- Build --
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: ref.watch(dashboardViewModelProvider),
        children: const [
          MapScreen(),
          NamesScreen(),
          ZikrsScreen(),
        ],
      ),
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color:
                primaryText(context)?.withOpacity(0.06) ?? Colors.red, // 6B7280
            blurRadius: Sizes.p32,
            offset: const Offset(0, -8),
          ),
        ],
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      padding: const EdgeInsets.only(
        top: Sizes.p4,
        bottom: Sizes.p8,
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
          child: Row(
            children: [
              _defaultButton(
                title: AppLocalizations.of(context)!.tabs_interesting,
                icon: AppIcons.map.assetName,
                index: 0,
              ),
              _defaultButton(
                title: AppLocalizations.of(context)!.tabs_names,
                icon: AppIcons.names.assetName,
                index: 1,
              ),
              _defaultButton(
                title: AppLocalizations.of(context)!.tabs_zikrs,
                icon: AppIcons.moon.assetName,
                index: 2,
              ),
              // _primaryButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _defaultButton(
      {required String title, required String icon, required int index}) {
    final iconColor = ref.watch(dashboardViewModelProvider) == index
        ? primaryText(context)
        : secondaryText(context);

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            ref.watch(dashboardViewModelProvider.notifier).set(index: index);
          });
        },
        behavior: HitTestBehavior.opaque,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: Sizes.p32,
              height: Sizes.p32,
              child: Center(
                child: SvgPicture.asset(
                  icon,
                  color: iconColor,
                  width: Sizes.p24,
                ),
              ),
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    letterSpacing: 0.3,
                    fontWeight: ref.watch(dashboardViewModelProvider) == index
                        ? FontWeight.bold
                        : FontWeight.w500,
                    color: iconColor,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
