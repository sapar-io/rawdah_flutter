import 'package:flutter/material.dart';

MaterialColor _primaryColor = const MaterialColor(
  0xFF22C55E, // 5
  <int, Color>{
    50: Color(0xFFDCFCE7), // 1
    100: Color(0xFFDCFCE7), // 1
    200: Color(0xFFBBF7D0), // 2
    300: Color(0xFFBBF7D0), // 2
    400: Color(0xFF86EFAC), // 3
    500: Color(0xFF86EFAC), // 3
    600: Color(0xFF4ADE80), // 4
    700: Color(0xFF4ADE80), // 4
    800: Color(0xFF22C55E), // 5
    900: Color(0xFF22C55E), // 5
  },
);

MaterialColor _secondaryColor = const MaterialColor(
  0xFF1A202C,
  <int, Color>{
    50: Color(0xFFFAFAFA),
    100: Color(0xFFF2F6FF),
    200: Color(0xFFF2F6FF),
    300: Color(0xFFD8E3F8),
    400: Color(0xFFD8E3F8),
    500: Color(0xFF96A3BE),
    600: Color(0xFF96A3BE),
    700: Color(0xFF5D6A83),
    800: Color(0xFF5D6A83),
    900: Color(0xFF1A202C),
  },
);

MaterialColor _greyscaleColor = const MaterialColor(
  0xFF121826,
  <int, Color>{
    50: Color(0xFFF8FAFC),
    100: Color(0xFFF1F5F9),
    200: Color(0xFFE2E8F0),
    300: Color(0xFFCBD5E1),
    400: Color(0xFF94A3B8),
    500: Color(0xFF64748B),
    600: Color(0xFF475569),
    700: Color(0xFF334155),
    800: Color(0xFF1E293B),
    900: Color(0xFF121826),
  },
);

class AppColors {
  static MaterialColor primary = _primaryColor;
  static MaterialColor secondary = _secondaryColor;
  static MaterialColor greyscale = _greyscaleColor;

  static Color gradientStartDark = const Color(0xFF2371B5);
  static Color gradientEndLight = const Color(0xFF42B6EE);

  static Color gradientSecondaryStart = const Color(0xFFF3C76E);
  static Color gradientSecondaryEnd = const Color(0xFFFFF9CA);

  static Color errorDark = const Color(0xFFDD3333);
  static Color errorBase = const Color(0xFFFF4747);
  static Color errorLight = const Color(0xFFFF7171);

  static Color warningDark = const Color(0xFFEAB308);
  static Color warningBase = const Color(0xFFFACC15);
  static Color warningLight = const Color(0xFFFDE047);

  static Color successDark = const Color(0xFF16A34A);
  static Color successBase = const Color(0xFF22C55E);
  static Color successLight = const Color(0xFF4ADE80);

  static Color teal = const Color(0xFF2DD4BF);
}
