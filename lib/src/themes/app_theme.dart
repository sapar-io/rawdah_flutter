library app_theme;

import 'package:flutter/material.dart';
import 'package:rawdah/src/constants/app_colors.dart';
import 'package:rawdah/src/constants/app_sizes.dart';

part 'app_light_theme.dart';
part 'app_dark_theme.dart';

ThemeData getAppTheme(Brightness brightness) {
  switch (brightness) {
    case Brightness.dark:
      return _darkTheme();
    case Brightness.light:
      return _lightTheme();
  }
}
