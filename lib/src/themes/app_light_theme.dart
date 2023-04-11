part of app_theme;

ThemeData _lightTheme() {
  return ThemeData(
    brightness: Brightness.light,
    // Main Color
    primarySwatch: AppColors.primary,
    primaryColor: AppColors.primary,
    // Card
    cardColor: AppColors.greyscale.shade100,
    // Background
    scaffoldBackgroundColor: Colors.white,
    // Nav
    appBarTheme: AppBarTheme(
      color: Colors.white,
      foregroundColor: AppColors.greyscale.shade900,
      titleTextStyle: TextStyle(
        fontFamily: 'SofiaSans',
        fontSize: Sizes.p20,
        fontWeight: FontWeight.w600,
        color: AppColors.greyscale.shade900,
      ),
      elevation: 0,
    ),
    // Font
    fontFamily: 'SofiaSans',
    // TextTheme
    textTheme: TextTheme(
      displayLarge: TextStyle(color: AppColors.greyscale),
      displayMedium: TextStyle(color: AppColors.greyscale),
      displaySmall: TextStyle(color: AppColors.greyscale),
      headlineLarge: TextStyle(color: AppColors.greyscale),
      headlineMedium: TextStyle(color: AppColors.greyscale),
      headlineSmall: TextStyle(color: AppColors.greyscale),
      titleLarge: TextStyle(color: AppColors.greyscale),
      titleMedium: TextStyle(color: AppColors.greyscale),
      titleSmall: TextStyle(color: AppColors.greyscale),
      labelLarge: TextStyle(color: AppColors.greyscale, fontSize: 15),
      labelMedium: TextStyle(color: AppColors.greyscale, fontSize: 14),
      labelSmall: TextStyle(color: AppColors.greyscale.shade400, fontSize: 13),
      bodyLarge: TextStyle(color: AppColors.greyscale, fontSize: 18),
      bodyMedium: TextStyle(color: AppColors.greyscale, fontSize: 17),
      bodySmall: TextStyle(color: AppColors.greyscale, fontSize: 16),
    ),
    // Divider
    dividerColor: AppColors.greyscale.shade300,
    // Dialog
    dialogBackgroundColor: AppColors.greyscale.shade100,
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
        color: AppColors.greyscale.shade400,
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
        borderSide: BorderSide(color: AppColors.greyscale.shade300),
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
