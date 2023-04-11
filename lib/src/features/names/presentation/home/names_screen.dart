import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:rawdah/src/common/presentation/secondary_button.dart';
import 'package:rawdah/src/constants/app_colors.dart';
import 'package:rawdah/src/constants/app_icons.dart';
import 'package:rawdah/src/constants/app_sizes.dart';
import 'package:rawdah/src/features/names/data/all_names.dart';
import 'package:rawdah/src/features/names/presentation/home/name_row.dart';
import 'package:rawdah/src/features/names/presentation/home/topic_row.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rawdah/src/routing/app_router.dart';
import 'package:rawdah/src/themes/text_color.dart';

class NamesScreen extends ConsumerStatefulWidget {
  const NamesScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NamesScreenState();
}

class _NamesScreenState extends ConsumerState<NamesScreen> {
  // -- Variables --
  final listBox = Hive.box('learned_names');
  final topicBox = Hive.box('learned_topics');

  // -- Methods --
  _showModal() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      backgroundColor: scaffoldBackground(context),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: ((context) {
        return SafeArea(
          child: Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
                child: Column(
                  children: [
                    gapH12,
                    Center(
                      child: Container(
                        width: Sizes.p48,
                        height: Sizes.p4,
                        decoration: BoxDecoration(
                          color: AppColors.greyscale.shade500,
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                      ),
                    ),
                    gapH16,
                    Text(
                      AppLocalizations.of(context)!.topic_close_first_text,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                    gapH16,
                    SecondaryButton(
                      text:
                          AppLocalizations.of(context)!.topic_test_close_button,
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  // -- Build --
  @override
  Widget build(BuildContext context) {
    AllNames.updateNames(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.home_title),
        actions: [
          IconButton(
            onPressed: () => context.pushNamed(AppRoute.settings.name),
            icon: SvgPicture.asset(
              AppIcons.settings.assetName,
              color: primaryText(context),
            ),
          ),
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            ColoredBox(
              color: Theme.of(context).cardColor,
              child: TabBar(
                labelColor: primaryText(context),
                indicatorColor: primary(context),
                tabs: [
                  Tab(
                    text: AppLocalizations.of(context)!.home_study,
                    icon: SvgPicture.asset(
                      AppIcons.book.assetName,
                      color: primaryText(context),
                    ),
                    iconMargin: const EdgeInsets.only(bottom: Sizes.p4),
                  ),
                  Tab(
                    text: AppLocalizations.of(context)!
                        .home_learned(listBox.values.length),
                    icon: SvgPicture.asset(
                      AppIcons.flag.assetName,
                      color: primaryText(context),
                    ),
                    iconMargin: const EdgeInsets.only(bottom: Sizes.p4),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView.builder(
                    padding: const EdgeInsets.only(bottom: Sizes.p64),
                    itemBuilder: (context, index) => TopicRow(
                      id: index,
                      callback: (isAvailable) {
                        if (isAvailable) {
                          context.pushNamed(
                            AppRoute.topic.name,
                            params: {'id': index.toString()},
                          );
                        } else {
                          _showModal();
                        }
                      },
                    ),
                    itemCount: 11,
                  ),
                  ListView.builder(
                    padding: const EdgeInsets.only(bottom: Sizes.p64),
                    itemBuilder: (context, index) {
                      final model = AllNames.allNames[index];
                      return NameRow(
                        model: model,
                        callback: (isAvailable) {
                          if (isAvailable) {
                            context.pushNamed(AppRoute.name.name, extra: model);
                          } else {
                            _showModal();
                          }
                        },
                      );
                    },
                    itemCount: AllNames.allNames.length,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
