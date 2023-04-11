import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:rawdah/src/constants/app_colors.dart';
import 'package:rawdah/src/constants/app_icons.dart';
import 'package:rawdah/src/constants/app_sizes.dart';
import 'package:rawdah/src/features/names/data/names_repository.dart';
import 'package:rawdah/src/themes/text_color.dart';

class TopicRow extends StatefulWidget {
  const TopicRow({
    super.key,
    required this.id,
    required this.callback,
  });

  final int id;
  final Function(bool) callback;

  @override
  State<TopicRow> createState() => _TopicRowState();
}

class _TopicRowState extends State<TopicRow> {
  // -- Variables --
  final listBox = Hive.box('learned_names');
  final topicBox = Hive.box('learned_topics');

  // -- Methods --
  Color? _getPercentageColor() {
    final isAvailable =
        NamesRepository.isAvailableTopic(widget.id, topicBox.values);
    final isTestComplete = topicBox.values.contains(widget.id);

    if (isTestComplete) return primary(context);
    if (NamesRepository.topicLearned(widget.id, listBox.values)) {
      return AppColors.warningBase;
    }
    if (isAvailable) return primaryText(context);
    return secondaryText(context);
  }

  Color? _getTopicColor() {
    final isAvailable =
        NamesRepository.isAvailableTopic(widget.id, topicBox.values);
    if (widget.id == 0) return primaryText(context);
    if (isAvailable) return primaryText(context);
    return secondaryText(context);
  }

  // -- Build --
  @override
  Widget build(BuildContext context) {
    final isLearned = NamesRepository.topicComplete(widget.id, listBox.values);
    final isAvailable =
        NamesRepository.isAvailableTopic(widget.id, topicBox.values);

    return InkWell(
      onTap: () => widget.callback(isAvailable),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.p16,
          vertical: Sizes.p12,
        ),
        child: Row(
          children: [
            SizedBox(
              width: 45,
              child: Text(
                NamesRepository.getTopicNumbers(widget.id),
                style: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(color: _getTopicColor()),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    NamesRepository.topicFirstName(widget.id).original,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontFamily: 'ScheherazadeNew', color: _getTopicColor()),
                  ),
                  Text(
                    NamesRepository.topicFirstName(widget.id).transcription,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: _getTopicColor()),
                  ),
                ],
              ),
            ),
            SvgPicture.asset(
              AppIcons.dotsHorizontal.assetName,
              width: Sizes.p16,
              color: secondaryText(context),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    NamesRepository.topicLastName(widget.id).original,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontFamily: 'ScheherazadeNew', color: _getTopicColor()),
                  ),
                  Text(
                    NamesRepository.topicLastName(widget.id).transcription,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: _getTopicColor()),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: _getPercentageColor()!),
                borderRadius: BorderRadius.circular(Sizes.p16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(Sizes.p8),
                child: isAvailable
                    ? Center(
                        child: Text(
                          topicBox.values.contains(widget.id)
                              ? "100%"
                              : '${NamesRepository.topicPercentege(widget.id, listBox.values)}%',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: _getPercentageColor()),
                        ),
                      )
                    : SvgPicture.asset(
                        AppIcons.lock.assetName,
                        width: Sizes.p16,
                        height: Sizes.p16,
                        color: secondaryText(context),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
