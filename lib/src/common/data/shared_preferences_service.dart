import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Служба общих настроек | Как NSDefaults
final sharedPreferencesServiceProvider =
    Provider<SharedPreferencesService>((ref) => throw UnimplementedError());

class SharedPreferencesService {
  SharedPreferencesService(this.sharedPreferences);
  final SharedPreferences sharedPreferences;

  static const onboardingKey = 'onboardingKey';

  Future<void> completeOnboarding() async {
    await sharedPreferences.setBool(onboardingKey, true);
  }

  bool isOnboardingCompleted() {
    final key = sharedPreferences.getBool(onboardingKey);
    if (key == null) return false;
    return key;
  }
}
