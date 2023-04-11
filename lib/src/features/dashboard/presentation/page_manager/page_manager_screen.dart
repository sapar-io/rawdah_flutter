import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firespeed/firespeed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rawdah/src/common/backend/auth_repository.dart';
import 'package:rawdah/src/common/backend/references.dart';
import 'package:rawdah/src/common/data/empty_type.dart';
import 'package:rawdah/src/common/data/user_view_model.dart';
import 'package:rawdah/src/common/domain/fire_user.dart';
import 'package:rawdah/src/common/presentation/empty_screen.dart';
import 'package:rawdah/src/features/dashboard/presentation/navbar/navbar_screen.dart';

class PageManagerScreen extends ConsumerStatefulWidget {
  const PageManagerScreen({super.key});

  @override
  ConsumerState<PageManagerScreen> createState() => _PageManagerScreenState();
}

class _PageManagerScreenState extends ConsumerState<PageManagerScreen> {
  // -- Variables --
  FireUser? _user;
  StreamSubscription<FireUser?>? _listener;

  // -- Methods --
  _getUser(String? uid) async {
    if (_listener != null || uid == null) return;

    Future.delayed(const Duration(seconds: 3), () async {
      try {
        _listener = FRRest.listenModel(
          ref: FirestoreRef.user(uid),
          fromMap: FireUser.fromMap,
        ).listen((e) {
          ref.read(userViewModelProvider.notifier).update(e);
          setState(() => _user = e);
        });
      } catch (e) {
        ref.read(authRepositoryProvider).signOut();
        debugPrint('error in page_manager when listen user: ${e.toString()}');
        return;
      }
    });
  }

  // -- Helpers --
  _logoutClearing() {
    _listener?.cancel();
    _listener = null;
    _subscribeTopicForNotifications(true, _user?.uid);
    _user = null;
    Future.delayed(Duration.zero, () {
      ref.read(userViewModelProvider.notifier).update(null);
    });
  }

  _subscribeTopicForNotifications(bool status, String? uid) async {
    if (uid == null) return;
    if (!mounted) return;
    if (status) {
      await FirebaseMessaging.instance.subscribeToTopic(uid);
    } else {
      await FirebaseMessaging.instance.unsubscribeFromTopic(uid);
    }
  }

  // -- Build --
  @override
  Widget build(BuildContext context) {
    // final isOnboardingCompleted = ref.watch(onboardingProvider);
    // if (!isOnboardingCompleted) return const OnboardingScreen();

    return Scaffold(
      body: ref.watch(_authStateChangesProvider).when(
        data: (user) {
          if (user == null) {
            _logoutClearing();
            return const NavbarScreen();
          }

          _getUser(user.uid);
          if (_user == null) {
            return const Center(child: CircularProgressIndicator());
          }

          if (_user!.status.isBanned) {
            return const EmptyScreen(type: EmptyScreenType.authBanned);
          } else if (_user!.status.isDeleted) {
            return const EmptyScreen(type: EmptyScreenType.authDeleted);
          } else {
            _subscribeTopicForNotifications(true, _user?.uid);
            return const NavbarScreen();
          }
        },
        error: (_, __) {
          return const EmptyScreen(type: EmptyScreenType.authError);
        },
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

// -- Provider --
final _authStateChangesProvider = StreamProvider<User?>((ref) {
  return ref.watch(authRepositoryProvider).authStateChange;
});
