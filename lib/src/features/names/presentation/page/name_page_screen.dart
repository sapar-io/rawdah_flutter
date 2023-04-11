import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:rawdah/src/common/presentation/primary_button.dart';
import 'package:rawdah/src/common/presentation/secondary_button.dart';
import 'package:rawdah/src/constants/app_icons.dart';
import 'package:rawdah/src/constants/app_sizes.dart';
import 'package:rawdah/src/features/names/domain/name.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rawdah/src/themes/text_color.dart';

class NamePageScreen extends ConsumerStatefulWidget {
  const NamePageScreen({
    super.key,
    required this.model,
  });

  final Name model;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NamePageScreenState();
}

class _NamePageScreenState extends ConsumerState<NamePageScreen> {
  // -- Variables --
  AudioPlayer player = AudioPlayer();
  bool _isPlaying = false;
  late bool _isLearned;
  final listBox = Hive.box('learned_names');

  // -- Methods --
  _playerTapped() async {
    if (player.state == PlayerState.playing) {
      player.pause();
      setState(() => _isPlaying = false);
    } else {
      player.setReleaseMode(ReleaseMode.loop);
      await player.play(AssetSource('audio/name${widget.model.number}.mp3'));
      setState(() => _isPlaying = true);
    }
  }

  _success() async {
    if (!listBox.values.contains(widget.model.number)) {
      await listBox.add(widget.model.number);
      setState(() => _isLearned = true);
    } else {
      print('uje');
    }
  }

  // -- Init --
  @override
  void initState() {
    _isLearned = listBox.values.contains(widget.model.number);
    super.initState();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  // -- Build --
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.model.number}. ${widget.model.transcription}'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
              child: Column(
                children: [
                  gapH12,
                  Text(
                    widget.model.original,
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(fontFamily: 'ScheherazadeNew'),
                  ),
                  gapH20,
                  Text(
                    widget.model.transcription,
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  gapH12,
                  Text(
                    widget.model.translate,
                    textAlign: TextAlign.center,
                  ),
                  gapH32,
                  InkWell(
                    onTap: _playerTapped,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(Sizes.p16),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(Sizes.p12),
                      ),
                      child: SvgPicture.asset(
                        _isPlaying
                            ? AppIcons.pause.assetName
                            : AppIcons.play.assetName,
                        width: Sizes.p32,
                        color: primary(context),
                      ),
                    ),
                  ),
                  gapH32,
                  Text(
                    AppLocalizations.of(context)!.lesson_description,
                    style: TextStyle(color: secondaryText(context)),
                  ),
                  gapH12,
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(bottom: Sizes.p32),
                      child: Text(
                        widget.model.description,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Theme.of(context).cardColor,
            padding: const EdgeInsets.all(Sizes.p16),
            child: SafeArea(
              child: _isLearned
                  ? SecondaryButton(
                      text: AppLocalizations.of(context)!.lesson_learned)
                  : PrimaryButton(
                      text: AppLocalizations.of(context)!.lesson_mark_learned,
                      onPressed: _success,
                    ),
            ),
          )
        ],
      ),
    );
  }
}
