part of app_theme;

ThemeData _darkTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    // Main Color
    primarySwatch: AppColors.primary,
    primaryColor: AppColors.primary,
    // Card
    cardColor: AppColors.greyscale.shade800,
    // Background
    scaffoldBackgroundColor: AppColors.greyscale,
    // Nav
    appBarTheme: AppBarTheme(
      color: AppColors.greyscale,
      foregroundColor: Colors.white,
      titleTextStyle: const TextStyle(
        fontFamily: 'SofiaSans',
        fontSize: Sizes.p20,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      elevation: 0,
    ),
    // Font
    fontFamily: 'SofiaSans',
    // TextTheme
    textTheme: TextTheme(
      displayLarge: const TextStyle(color: Colors.white),
      displayMedium: const TextStyle(color: Colors.white),
      displaySmall: const TextStyle(color: Colors.white),
      headlineLarge: const TextStyle(color: Colors.white),
      headlineMedium: const TextStyle(color: Colors.white),
      headlineSmall: const TextStyle(color: Colors.white),
      titleLarge: const TextStyle(color: Colors.white),
      titleMedium: const TextStyle(color: Colors.white),
      titleSmall: const TextStyle(color: Colors.white),
      labelLarge: const TextStyle(color: Colors.white, fontSize: 15),
      labelMedium: const TextStyle(color: Colors.white, fontSize: 14),
      labelSmall: TextStyle(color: AppColors.greyscale.shade500, fontSize: 13),
      bodyLarge: const TextStyle(color: Colors.white, fontSize: 18),
      bodyMedium: const TextStyle(color: Colors.white, fontSize: 17),
      bodySmall: const TextStyle(color: Colors.white, fontSize: 16),
    ),
    // Divider
    dividerColor: AppColors.greyscale.shade700,
    // Dialog
    dialogBackgroundColor: AppColors.greyscale.shade800,
    // Button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Sizes.p16),
        ),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
      elevation: 0,
      iconSize: Sizes.p24,
      foregroundColor: Colors.white,
    ),
    // CheckboxThemeData
    checkboxTheme: CheckboxThemeData(
      side: BorderSide(
        color: AppColors.greyscale.shade600,
      ),
    ),
    toggleableActiveColor: AppColors.primary,
    // TextField
    inputDecorationTheme: InputDecorationTheme(
      filled: false,
      hintStyle: TextStyle(color: AppColors.greyscale.shade500),
      iconColor: AppColors.greyscale.shade500,
      prefixIconColor: AppColors.greyscale.shade500,
      suffixIconColor: AppColors.greyscale.shade500,
      // Height
      contentPadding: const EdgeInsets.symmetric(
        horizontal: Sizes.p16,
        vertical: Sizes.p16,
      ),
      // Border
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Sizes.p16),
        borderSide: BorderSide(color: AppColors.greyscale.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Sizes.p16),
        borderSide: BorderSide(color: AppColors.primary),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Sizes.p16),
        borderSide: BorderSide(color: AppColors.greyscale.shade700),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Sizes.p16),
        borderSide: BorderSide(color: AppColors.errorBase),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Sizes.p16),
        borderSide: BorderSide(color: AppColors.errorBase),
      ),
    ),
  );
}
