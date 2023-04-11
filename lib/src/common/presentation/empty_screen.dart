library empty;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rawdah/src/common/data/empty_type.dart';
import 'package:rawdah/src/common/presentation/primary_button.dart';
import 'package:rawdah/src/constants/app_sizes.dart';
import 'package:rawdah/src/common/presentation/secondary_button.dart';
import 'package:rawdah/src/common/backend/auth_repository.dart';
import 'package:rawdah/src/routing/app_router.dart';

class EmptyScreen extends ConsumerWidget {
  const EmptyScreen({
    Key? key,
    required this.type,
  }) : super(key: key);

  final EmptyScreenType type;

  // -- Build --
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(Sizes.p16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            type.illustration == null
                ? Container()
                : SizedBox(
                    height: 300,
                    child: Image.asset(type.illustration!),
                  ),
            Text(
              type.title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
            gapH8,
            Text(
              type.description,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            gapH32,
            _footer(context, ref),
          ],
        ),
      ),
    );
  }

  Widget _footer(BuildContext context, WidgetRef ref) {
    switch (type.buttons) {
      case EmptyScreenButton.login:
        return Column(
          children: [
            PrimaryButton(
              text: 'Войти',
              onPressed: () =>
                  context.pushNamed(AppRoute.auth.name, extra: true),
            ),
            gapH12,
            SecondaryButton(
              text: 'Создать аккаунт',
              onPressed: () =>
                  context.pushNamed(AppRoute.auth.name, extra: false),
            ),
          ],
        );
      case EmptyScreenButton.logout:
        return PrimaryButton(
          text: 'Выйти',
          onPressed: () => ref.read(authRepositoryProvider).signOut(),
        );
      case EmptyScreenButton.none:
        return Container();
    }
  }
}
