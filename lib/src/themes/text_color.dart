import 'package:flutter/material.dart';

Color? primary(BuildContext context) => Theme.of(context).primaryColor;

Color? scaffoldBackground(BuildContext context) =>
    Theme.of(context).scaffoldBackgroundColor;

Color? primaryText(BuildContext context) =>
    Theme.of(context).textTheme.bodyLarge?.color;

Color? secondaryText(BuildContext context) =>
    Theme.of(context).textTheme.labelSmall?.color;
