import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:rawdah/src/constants/app_icons.dart';
import 'package:rawdah/src/constants/app_sizes.dart';
import 'package:rawdah/src/features/names/domain/name.dart';
import 'package:rawdah/src/themes/text_color.dart';

class NameRow extends StatefulWidget {
  const NameRow({super.key, required this.model, required this.callback});

  final Name model;
  final Function(bool) callback;

  @override
  State<NameRow> createState() => _NameRowState();
}

class _NameRowState extends State<NameRow> {
  // -- Variables --
  final listBox = Hive.box('learned_names');

  // -- Build --
  @override
  Widget build(BuildContext context) {
    final isLearned = listBox.values.contains(widget.model.number);

    return InkWell(
      onTap: () => widget.callback(isLearned),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.p16,
          vertical: Sizes.p12,
        ),
        child: Row(
          children: [
            Text(
              widget.model.number.toString(),
              style: TextStyle(
                color:
                    isLearned ? primaryText(context) : secondaryText(context),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    widget.model.original,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontFamily: 'ScheherazadeNew',
                          color: isLearned
                              ? primaryText(context)
                              : secondaryText(context),
                        ),
                  ),
                  Text(
                    widget.model.transcription,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: isLearned
                              ? primaryText(context)
                              : secondaryText(context),
                        ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Text(
                widget.model.translate,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: isLearned
                        ? primaryText(context)
                        : secondaryText(context)),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            gapW12,
            isLearned
                ? SvgPicture.asset(
                    AppIcons.check.assetName,
                    color: primary(context),
                  )
                : SvgPicture.asset(
                    AppIcons.lock.assetName,
                    color: secondaryText(context),
                  ),
          ],
        ),
      ),
    );
  }
}
