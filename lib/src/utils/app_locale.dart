import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Используется для страница аудентификации, для переключение между входом и регистрацией
final appLocaleProvider = StateNotifierProvider<_AppLocaleViewModel, Locale?>(
    (_) => _AppLocaleViewModel());

class _AppLocaleViewModel extends StateNotifier<Locale?> {
  _AppLocaleViewModel() : super(null);

  void set(Locale? locale) {
    state = locale;
  }
}
