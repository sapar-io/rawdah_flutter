import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:rawdah/src/constants/app_colors.dart';
import 'package:rawdah/src/constants/app_icons.dart';
import 'package:rawdah/src/constants/app_sizes.dart';
import 'package:rawdah/src/features/names/data/names_repository.dart';
import 'package:rawdah/src/features/names/domain/name.dart';
import 'package:rawdah/src/features/test/data/test_repository.dart';
import 'package:rawdah/src/features/test/presentation/test_results.dart';
import 'package:rawdah/src/themes/text_color.dart';

class TestScreen extends ConsumerStatefulWidget {
  const TestScreen({super.key, required this.id});

  final String id;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TestScreenState();
}

class _TestScreenState extends ConsumerState<TestScreen> {
  // -- Variables --
  List<QuizTest> _quizTests = [];
  List<TrueFalseTest> _trueFalseTests = [];
  int _currentIndex = 0;
  int _correctCounter = 0;
  int _mistakeCounter = 0;
  int? _addBorderButtonIndex;
  bool? _addBorderButtonIsCorrect;
  bool _isLoading = false;
  bool _showResult = false;
  final listBox = Hive.box('learned_topics');

  _selectQuizOption(Name name) {
    var isCorrect = name == _quizTests[_currentIndex].correct;
    setState(() {
      _addBorderButtonIsCorrect = isCorrect;
      _isLoading = true;
    });

    Timer(const Duration(milliseconds: 500), () {
      setState(() {
        if (isCorrect) {
          _correctCounter += 1;
        } else {
          _mistakeCounter += 1;
        }
        _currentIndex += 1;
        _addBorderButtonIsCorrect = null;
        _isLoading = false;
      });
    });
  }

  _selectTrueFalseOption(bool isTrue) {
    var isCorrect = _trueFalseTests[_currentIndex - 9].isCorrect == isTrue;
    setState(() {
      _addBorderButtonIsCorrect = isCorrect;
      _isLoading = true;
    });

    Timer(const Duration(milliseconds: 500), () {
      setState(() {
        if (isCorrect) {
          _correctCounter += 1;
        } else {
          _mistakeCounter += 1;
        }
      });

      if (_currentIndex == (_quizTests.length + _trueFalseTests.length - 1)) {
        setState(() => _showResult = true);
        if (_mistakeCounter == 0) {
          _success();
        }
        return;
      }

      setState(() {
        _currentIndex += 1;
        _addBorderButtonIsCorrect = null;
        _isLoading = false;
      });
    });
  }

  _success() async {
    final id = int.parse(widget.id);
    if (!listBox.values.contains(id)) {
      await listBox.add(id);
      print('da');
    } else {
      print('uje');
    }
  }

  // -- Init --
  @override
  void initState() {
    super.initState();
    _quizTests = TestRepository.generateTopicQuizTest(widget.id);
    _trueFalseTests = TestRepository.generateTopicTrueFalseTest(widget.id);
  }

  // -- Build --
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${AppLocalizations.of(context)!.test_title} ${NamesRepository.getTopicNumbers(int.parse(widget.id))}",
        ),
      ),
      body: Stack(
        children: [
          _quizOrTestView(),
          !_showResult
              ? Container()
              : TestResultsScreen(
                  topic: int.parse(widget.id),
                  correctCounter: _correctCounter,
                  mistakeCounter: _mistakeCounter,
                  callback: () {
                    if (_mistakeCounter == 0) {
                      context.pop();
                    } else {
                      setState(() {
                        _currentIndex = 0;
                        _correctCounter = 0;
                        _mistakeCounter = 0;
                        _addBorderButtonIndex = null;
                        _addBorderButtonIsCorrect = null;
                        _isLoading = false;
                        _showResult = false;
                        _quizTests =
                            TestRepository.generateTopicQuizTest(widget.id);
                        _trueFalseTests =
                            TestRepository.generateTopicTrueFalseTest(
                                widget.id);
                      });
                    }
                  },
                ),
        ],
      ),
    );
  }

  // -- Widgets --
  Widget _quizOrTestView() {
    if (_currentIndex < 9) {
      return _quizTestView();
    } else {
      return _trueFalseTestView();
    }
  }

  Widget _quizTestView() {
    return Column(
      children: [
        _loader(),
        gapH32,
        Text(_quizTests[_currentIndex].correct.original),
        gapH12,
        Text(_quizTests[_currentIndex].correct.transcription),
        gapH20,
        _balance(),
        _quizButtons()
      ],
    );
  }

  Widget _trueFalseTestView() {
    return Column(
      children: [
        _loader(),
        gapH32,
        Text(_trueFalseTests[_currentIndex - 9].correct.original),
        gapH12,
        Text(_trueFalseTests[_currentIndex - 9].correct.transcription),
        gapH12,
        Text(
          "${_trueFalseTests[_currentIndex - 9].option.translate}?",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        gapH20,
        _balance(),
        _testButtons()
      ],
    );
  }

  Widget _loader() {
    final width = MediaQuery.of(context).size.width;
    final loaderWidth = width /
        (_quizTests.length + _trueFalseTests.length) *
        (_currentIndex + 1);

    return Stack(
      children: [
        Container(
          color: Theme.of(context).cardColor,
          width: double.infinity,
          height: 30,
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: 30,
          width: loaderWidth,
          color: primary(context),
        ),
        SizedBox(
          height: 30,
          child: Center(
              child: Text(AppLocalizations.of(context)!.test_question_number(
                  _currentIndex + 1,
                  _quizTests.length + _trueFalseTests.length))),
        ),
      ],
    );
  }

  Widget _balance() {
    return Column(
      children: [
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppIcons.correct.assetName,
              color: primary(context),
            ),
            gapW4,
            Text(
              _correctCounter.toString(),
              style: TextStyle(color: primary(context)),
            ),
            gapW16,
            SvgPicture.asset(
              AppIcons.mistake.assetName,
              color: AppColors.errorBase,
            ),
            gapW4,
            Text(
              _mistakeCounter.toString(),
              style: TextStyle(color: AppColors.errorBase),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }

  Widget _quizButtons() {
    return Padding(
      padding: const EdgeInsets.all(Sizes.p16),
      child: Column(
        children: [
          Row(
            children: [
              _button(
                index: 1,
                title: _quizTests[_currentIndex].options[0].translate,
                callback: () =>
                    _selectQuizOption(_quizTests[_currentIndex].options[0]),
              ),
              gapW12,
              _button(
                index: 2,
                title: _quizTests[_currentIndex].options[1].translate,
                callback: () =>
                    _selectQuizOption(_quizTests[_currentIndex].options[1]),
              ),
            ],
          ),
          gapH12,
          Row(
            children: [
              _button(
                index: 3,
                title: _quizTests[_currentIndex].options[2].translate,
                callback: () =>
                    _selectQuizOption(_quizTests[_currentIndex].options[2]),
              ),
              gapW12,
              _button(
                index: 4,
                title: _quizTests[_currentIndex].options[3].translate,
                callback: () =>
                    _selectQuizOption(_quizTests[_currentIndex].options[3]),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _testButtons() {
    return Padding(
      padding: const EdgeInsets.all(Sizes.p16),
      child: Column(
        children: [
          Row(
            children: [
              _button(
                index: 1,
                title: AppLocalizations.of(context)!.test_true,
                callback: () => _selectTrueFalseOption(true),
              ),
              gapW12,
              _button(
                index: 2,
                title: AppLocalizations.of(context)!.test_false,
                callback: () => _selectTrueFalseOption(false),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _button({
    required int index,
    required String title,
    required VoidCallback callback,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (_isLoading) return;
          _addBorderButtonIndex = index;
          callback();
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Sizes.p8),
            color: Theme.of(context).cardColor,
            border: Border.all(
              width: 3,
              color: _addBorderButtonIsCorrect == null ||
                      _addBorderButtonIndex != index
                  ? Colors.transparent
                  : _addBorderButtonIsCorrect == true
                      ? AppColors.successBase
                      : AppColors.errorBase,
            ),
          ),
          padding: const EdgeInsets.all(Sizes.p4),
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
