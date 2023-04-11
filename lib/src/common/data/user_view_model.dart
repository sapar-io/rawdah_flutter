import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rawdah/src/common/domain/fire_user.dart';

// Используется для страница аудентификации, для переключение между входом и регистрацией
final userViewModelProvider =
    StateNotifierProvider<_UserViewModel, FireUser?>((_) => _UserViewModel());

class _UserViewModel extends StateNotifier<FireUser?> {
  _UserViewModel() : super(null);

  void update(FireUser? user) {
    state = user;
  }
}
