import 'package:rawdah/src/features/names/data/all_names.dart';
import 'package:rawdah/src/features/names/data/names_repository.dart';
import 'package:rawdah/src/features/names/domain/name.dart';

class QuizTest {
  final Name correct;
  final List<Name> options;

  QuizTest({
    required this.correct,
    required this.options,
  });
}

class TrueFalseTest {
  final Name correct;
  final Name option;
  final bool isCorrect;

  TrueFalseTest({
    required this.correct,
    required this.option,
    required this.isCorrect,
  });
}

class TestRepository {
  static List<QuizTest> generateTopicQuizTest(String id) {
    final ids = NamesRepository.getTopicNamesAllIDs(int.parse(id));
    final list = ids.map((e) => AllNames.allNames[e - 1]).toList();
    List<QuizTest> tests = [];

    list.shuffle();
    for (int i = 0; i < list.length; i++) {
      final name = list[i];
      final options = _getOptions(list: list, name: name);
      QuizTest testModel = QuizTest(correct: name, options: options);
      tests.add(testModel);
    }

    return tests;
  }

  static List<TrueFalseTest> generateTopicTrueFalseTest(String id) {
    final ids = NamesRepository.getTopicNamesAllIDs(int.parse(id));
    final list = ids.map((e) => AllNames.allNames[e - 1]).toList();
    List<TrueFalseTest> tests = [];

    list.shuffle();
    for (int i = 0; i < list.length; i++) {
      tests.add(TrueFalseTest(
        correct: list[i],
        option: _getMistakeOption(list: list, name: list[i]),
        isCorrect: false,
      ));
      tests.add(TrueFalseTest(
        correct: list[i],
        option: list[i],
        isCorrect: true,
      ));
    }
    tests.shuffle();
    tests.shuffle();
    tests.shuffle();
    return tests;
  }

  static List<Name> _getOptions(
      {required List<Name> list, required Name name}) {
    List<Name> withoutCorrectName = [];

    for (var model in list) {
      if (model != name) {
        withoutCorrectName.add(model);
      }
    }

    withoutCorrectName.shuffle();
    var options = withoutCorrectName.take(3).toList();
    options.add(name);
    options.shuffle();
    return options;
  }

  static Name _getMistakeOption(
      {required List<Name> list, required Name name}) {
    List<Name> withoutCorrectName = [];

    for (var model in list) {
      if (model != name) {
        withoutCorrectName.add(model);
      }
    }

    withoutCorrectName.shuffle();
    return withoutCorrectName.first;
  }
}
