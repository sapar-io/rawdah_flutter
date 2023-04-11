import 'package:flutter_riverpod/flutter_riverpod.dart';

class _OnboardingViewModel extends StateNotifier<bool> {
  _OnboardingViewModel() : super(false);

  void completeOnboarding() {
    state = true;
  }
}

final onboardingProvider = StateNotifierProvider<_OnboardingViewModel, bool>(
    (_) => _OnboardingViewModel());
