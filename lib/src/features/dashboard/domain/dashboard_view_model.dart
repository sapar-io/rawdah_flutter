import 'package:flutter_riverpod/flutter_riverpod.dart';

// Используется для страница аудентификации, для переключение между входом и регистрацией
final dashboardViewModelProvider =
    StateNotifierProvider<_DashboardViewModel, int>(
        (_) => _DashboardViewModel());

class _DashboardViewModel extends StateNotifier<int> {
  _DashboardViewModel() : super(1);

  void set({required int index}) {
    state = index;
  }
}
