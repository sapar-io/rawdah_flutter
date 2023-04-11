import 'package:rawdah/src/features/names/data/all_names.dart';
import 'package:rawdah/src/features/names/domain/name.dart';

class NamesRepository {
  static List<int> getTopicNamesIDs(int id) {
    var count = id + 1;
    int firstIndex = 9 * (count - 1) + 1;
    int lastIndex = count * 9;
    return [firstIndex, lastIndex];
  }

  static List<int> getTopicNamesAllIDs(int id) {
    var count = id + 1;
    int firstIndex = 9 * (count - 1) + 1;
    return List.generate(9, (int index) => firstIndex + index);
  }

  static String getTopicNumbers(int id) {
    final names = getTopicNamesIDs(id);
    return '${names.first}-${names.last}';
  }

  static int topicPercentege(int id, Iterable<dynamic> values) {
    final names = NamesRepository.getTopicNamesIDs(id);

    int learnedCounter = 0;
    for (int i = 0; i < 9; i++) {
      if (values.contains(names.first + i)) {
        learnedCounter += 1;
      }
    }
    return (10 * learnedCounter).round();
  }

  static bool topicComplete(int id, Iterable<dynamic> values) {
    return topicPercentege(id, values) == 100;
  }

  static bool topicLearned(int id, Iterable<dynamic> values) {
    return topicPercentege(id, values) == 90;
  }

  static Name topicFirstName(int id) {
    final names = getTopicNamesIDs(id);
    return AllNames.allNames[names.first - 1];
  }

  static Name topicLastName(int id) {
    final names = getTopicNamesIDs(id);
    return AllNames.allNames[names.last - 1];
  }

  static bool isAvailableTopic(int id, Iterable<dynamic> values) {
    if (id == 0) return true;
    return values.contains(id - 1);
  }
}
