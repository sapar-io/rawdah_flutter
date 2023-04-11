import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:rawdah/src/common/presentation/primary_button.dart';
import 'package:rawdah/src/common/presentation/secondary_button.dart';
import 'package:rawdah/src/constants/app_icons.dart';
import 'package:rawdah/src/constants/app_sizes.dart';
import 'package:rawdah/src/features/names/data/all_names.dart';
import 'package:rawdah/src/features/names/data/names_repository.dart';
import 'package:rawdah/src/routing/app_router.dart';
import 'package:rawdah/src/themes/text_color.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TopicScreen extends ConsumerStatefulWidget {
  const TopicScreen({super.key, required this.id});

  final String id;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TopicScreenState();
}

class _TopicScreenState extends ConsumerState<TopicScreen> {
  // -- Variables --
  final listBox = Hive.box('learned_names');
  final topicBox = Hive.box('learned_topics');

  // -- Methods --
  _openTest() {
    final learned =
        NamesRepository.topicLearned(int.parse(widget.id), listBox.values);

    if (!learned) {
      return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(AppLocalizations.of(context)!.topic_test_close_title),
          content:
              Text(AppLocalizations.of(context)!.topic_test_close_description),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child:
                  Text(AppLocalizations.of(context)!.topic_test_close_button),
            )
          ],
        ),
      );
    }

    context.pushNamed(AppRoute.test.name, params: {'id': widget.id});
  }

  // -- Build --
  @override
  Widget build(BuildContext context) {
    final id = int.parse(widget.id);
    final learned =
        NamesRepository.topicLearned(int.parse(widget.id), listBox.values);

    return Scaffold(
      appBar: AppBar(
        title: Text(
            '${NamesRepository.getTopicNumbers(id)} ${AppLocalizations.of(context)?.topic_title}'),
      ),
      body: Column(
        children: [
          Flexible(
            child: Container(
              margin: const EdgeInsets.all(Sizes.p4),
              child: Column(
                children: [
                  Flexible(
                    child: Row(
                      children: [
                        _name(0),
                        gapW4,
                        _name(1),
                        gapW4,
                        _name(2),
                      ],
                    ),
                  ),
                  gapH4,
                  Flexible(
                    child: Row(
                      children: [
                        _name(3),
                        gapW4,
                        _name(4),
                        gapW4,
                        _name(5),
                      ],
                    ),
                  ),
                  gapH4,
                  Flexible(
                    child: Row(
                      children: [
                        _name(6),
                        gapW4,
                        _name(7),
                        gapW4,
                        _name(8),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Theme.of(context).cardColor,
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.p16,
              vertical: Sizes.p16,
            ),
            child: SafeArea(
              child: topicBox.values.contains(int.parse(widget.id))
                  ? SecondaryButton(
                      text: AppLocalizations.of(context)!.test_error_button,
                      onPressed: _openTest,
                    )
                  : learned
                      ? PrimaryButton(
                          text: AppLocalizations.of(context)!.topic_test_button,
                          onPressed: _openTest,
                        )
                      : SecondaryButton(
                          text: AppLocalizations.of(context)!.topic_test_button,
                          onPressed: _openTest,
                        ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _name(int index) {
    final id = NamesRepository.getTopicNamesIDs(int.parse(widget.id)).first +
        index -
        1;
    final name = AllNames.allNames[id];

    return Flexible(
      fit: FlexFit.tight,
      child: InkWell(
        onTap: () => context.pushNamed(AppRoute.name.name, extra: name),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Sizes.p8),
              color: Theme.of(context).cardColor,
              border: Border.all(
                  color: listBox.values.contains(name.number)
                      ? primary(context)!
                      : Colors.transparent)),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(Sizes.p8),
                  child: SvgPicture.asset(
                    AppIcons.check.assetName,
                    color: listBox.values.contains(name.number)
                        ? primary(context)
                        : secondaryText(context),
                  ),
                ),
              ),
              Column(
                children: [
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: Center(
                      child: Text(
                        name.original,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontFamily: 'ScheherazadeNew'),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    fit: FlexFit.tight,
                    child: Column(
                      children: [
                        Text(
                          "${name.number}. ${name.transcription}",
                          textAlign: TextAlign.center,
                        ),
                        gapH4,
                        Text(
                          name.translate,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(color: secondaryText(context)),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
