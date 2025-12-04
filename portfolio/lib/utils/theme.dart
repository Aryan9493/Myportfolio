import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// App color palette
class AppColors {
  // Primary colors
  static const deepNavy = Color(0xFF0B132B);
  static const accentTeal = Color(0xFF00BFA6);
  static const warmGold = Color(0xFFFFB86B);
  
  // Neutral greys
  static const grey50 = Color(0xFFFAFAFA);
  static const grey100 = Color(0xFFF5F5F5);
  static const grey200 = Color(0xFFEEEEEE);
  static const grey300 = Color(0xFFE0E0E0);
  static const grey400 = Color(0xFFBDBDBD);
  static const grey500 = Color(0xFF9E9E9E);
  static const grey600 = Color(0xFF757575);
  static const grey700 = Color(0xFF616161);
  static const grey800 = Color(0xFF424242);
  static const grey900 = Color(0xFF212121);
  
  // Glassmorphism backgrounds
  static const glassLight = Color(0xCCFFFFFF); // 80% white
  static const glassDark = Color(0xCC1A1F3A); // 80% dark navy
}

/// Animation durations
class AppAnimations {
  static const fast = Duration(milliseconds: 150);
  static const normal = Duration(milliseconds: 250);
  static const slow = Duration(milliseconds: 300);
}

/// Shadow configurations
class AppShadows {
  static List<BoxShadow> get cardShadow => [
    BoxShadow(
      color: Colors.black.withOpacity(0.08),
      blurRadius: 16,
      offset: const Offset(0, 4),
    ),
  ];
  
  static List<BoxShadow> get cardShadowHover => [
    BoxShadow(
      color: Colors.black.withOpacity(0.12),
      blurRadius: 24,
      offset: const Offset(0, 8),
    ),
  ];
  
  static List<BoxShadow> get glassShadow => [
    BoxShadow(
      color: Colors.black.withOpacity(0.05),
      blurRadius: 20,
      offset: const Offset(0, 8),
    ),
  ];
}

/// Light theme configuration
ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    primary: AppColors.accentTeal,
    secondary: AppColors.warmGold,
    surface: AppColors.grey50,
    onSurface: AppColors.deepNavy,
    onPrimary: Colors.white,
  ),
  scaffoldBackgroundColor: AppColors.grey50,
  
  // Typography
  textTheme: TextTheme(
    displayLarge: GoogleFonts.inter(
      fontSize: 56,
      fontWeight: FontWeight.w700,
      color: AppColors.deepNavy,
      height: 1.2,
    ),
    displayMedium: GoogleFonts.inter(
      fontSize: 48,
      fontWeight: FontWeight.w700,
      color: AppColors.deepNavy,
      height: 1.2,
    ),
    displaySmall: GoogleFonts.inter(
      fontSize: 36,
      fontWeight: FontWeight.w700,
      color: AppColors.deepNavy,
      height: 1.3,
    ),
    headlineLarge: GoogleFonts.inter(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      color: AppColors.deepNavy,
      height: 1.3,
    ),
    headlineMedium: GoogleFonts.inter(
      fontSize: 28,
      fontWeight: FontWeight.w600,
      color: AppColors.deepNavy,
      height: 1.4,
    ),
    headlineSmall: GoogleFonts.inter(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: AppColors.deepNavy,
      height: 1.4,
    ),
    titleLarge: GoogleFonts.inter(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.deepNavy,
      height: 1.5,
    ),
    titleMedium: GoogleFonts.inter(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: AppColors.deepNavy,
      height: 1.5,
    ),
    titleSmall: GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.deepNavy,
      height: 1.5,
    ),
    bodyLarge: GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.grey700,
      height: 1.6,
    ),
    bodyMedium: GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.grey700,
      height: 1.6,
    ),
    bodySmall: GoogleFonts.inter(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.grey600,
      height: 1.5,
    ),
    labelLarge: GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.deepNavy,
      height: 1.4,
    ),
  ),
  
  // Card theme
  cardTheme: const CardThemeData(
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
    color: Colors.white,
  ),
  
  // Elevated button theme
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.accentTeal,
      foregroundColor: Colors.white,
      elevation: 0,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      textStyle: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
  
  // Outlined button theme
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColors.accentTeal,
      side: const BorderSide(color: AppColors.accentTeal, width: 2),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      textStyle: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
  
  // Input decoration theme
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: AppColors.grey300),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: AppColors.grey300),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.accentTeal, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.red, width: 2),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    labelStyle: GoogleFonts.inter(
      fontSize: 14,
      color: AppColors.grey600,
    ),
  ),
);

/// Dark theme configuration
ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    primary: AppColors.accentTeal,
    secondary: AppColors.warmGold,
    surface: AppColors.deepNavy,
    onSurface: Colors.white,
    onPrimary: AppColors.deepNavy,
  ),
  scaffoldBackgroundColor: AppColors.deepNavy,
  
  // Typography
  textTheme: TextTheme(
    displayLarge: GoogleFonts.inter(
      fontSize: 56,
      fontWeight: FontWeight.w700,
      color: Colors.white,
      height: 1.2,
    ),
    displayMedium: GoogleFonts.inter(
      fontSize: 48,
      fontWeight: FontWeight.w700,
      color: Colors.white,
      height: 1.2,
    ),
    displaySmall: GoogleFonts.inter(
      fontSize: 36,
      fontWeight: FontWeight.w700,
      color: Colors.white,
      height: 1.3,
    ),
    headlineLarge: GoogleFonts.inter(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      color: Colors.white,
      height: 1.3,
    ),
    headlineMedium: GoogleFonts.inter(
      fontSize: 28,
      fontWeight: FontWeight.w600,
      color: Colors.white,
      height: 1.4,
    ),
    headlineSmall: GoogleFonts.inter(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: Colors.white,
      height: 1.4,
    ),
    titleLarge: GoogleFonts.inter(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.white,
      height: 1.5,
    ),
    titleMedium: GoogleFonts.inter(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: Colors.white,
      height: 1.5,
    ),
    titleSmall: GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.white,
      height: 1.5,
    ),
    bodyLarge: GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.grey300,
      height: 1.6,
    ),
    bodyMedium: GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.grey300,
      height: 1.6,
    ),
    bodySmall: GoogleFonts.inter(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.grey400,
      height: 1.5,
    ),
    labelLarge: GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Colors.white,
      height: 1.4,
    ),
  ),
  
  // Card theme
  cardTheme: const CardThemeData(
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
    color: AppColors.glassDark,
  ),
  
  // Elevated button theme
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.accentTeal,
      foregroundColor: AppColors.deepNavy,
      elevation: 0,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      textStyle: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
  
  // Outlined button theme
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColors.accentTeal,
      side: const BorderSide(color: AppColors.accentTeal, width: 2),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      textStyle: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
  
  // Input decoration theme
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.glassDark,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: AppColors.grey700),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: AppColors.grey700),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.accentTeal, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.red, width: 2),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    labelStyle: GoogleFonts.inter(
      fontSize: 14,
      color: AppColors.grey400,
    ),
  ),
);
