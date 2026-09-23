import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.primary,
        onPrimary: AppColors.onPrimary,
        primaryContainer: AppColors.primaryContainer,
        onPrimaryContainer: AppColors.onPrimaryContainer,
        secondary: AppColors.secondary,
        onSecondary: AppColors.onSecondary,
        secondaryContainer: AppColors.secondaryContainer,
        onSecondaryContainer: AppColors.onSecondaryContainer,
        tertiary: AppColors.tertiary,
        onTertiary: AppColors.onTertiary,
        tertiaryContainer: AppColors.tertiaryContainer,
        onTertiaryContainer: AppColors.onTertiaryContainer,
        error: AppColors.error,
        onError: AppColors.onError,
        errorContainer: AppColors.errorContainer,
        onErrorContainer: AppColors.onErrorContainer,
        surface: AppColors.surface,
        onSurface: AppColors.onSurface,
        surfaceContainerHighest: AppColors.surfaceContainerHighest,
        onSurfaceVariant: AppColors.onSurfaceVariant,
        outline: AppColors.outline,
        outlineVariant: AppColors.outlineVariant,
        inverseSurface: AppColors.inverseSurface,
        onInverseSurface: AppColors.inverseOnSurface,
        inversePrimary: AppColors.inversePrimary,
        shadow: Colors.black,
        scrim: Colors.black,
      ),
      scaffoldBackgroundColor: AppColors.background,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.onSurface,
        elevation: 0,
        scrolledUnderElevation: 1,
      ),
      fontFamily: 'Inter',
      fontFamilyFallback: const <String>['Noto Sans Khmer'],
      useMaterial3: true,
    );
  }

  // Text Styles mapped from Tailwind typography
  static const TextStyle displayHeroMobile = TextStyle(
    fontFamily: 'Inter',
    fontFamilyFallback: <String>['Noto Sans Khmer'],
    fontSize: 28,
    height: 36 / 28,
    letterSpacing: -0.28,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle displayHero = TextStyle(
    fontFamily: 'Inter',
    fontFamilyFallback: <String>['Noto Sans Khmer'],
    fontSize: 36,
    height: 44 / 36,
    letterSpacing: -0.72,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle headlineLg = TextStyle(
    fontFamily: 'Inter',
    fontFamilyFallback: <String>['Noto Sans Khmer'],
    fontSize: 24,
    height: 32 / 24,
    letterSpacing: -0.24,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle headlineMd = TextStyle(
    fontFamily: 'Inter',
    fontFamilyFallback: <String>['Noto Sans Khmer'],
    fontSize: 20,
    height: 28 / 20,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle headlineSm = TextStyle(
    fontFamily: 'Inter',
    fontFamilyFallback: <String>['Noto Sans Khmer'],
    fontSize: 16,
    height: 24 / 16,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle bodyLg = TextStyle(
    fontFamily: 'Inter',
    fontFamilyFallback: <String>['Noto Sans Khmer'],
    fontSize: 16,
    height: 24 / 16,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle bodyMd = TextStyle(
    fontFamily: 'Inter',
    fontFamilyFallback: <String>['Noto Sans Khmer'],
    fontSize: 14,
    height: 20 / 14,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle bodySm = TextStyle(
    fontFamily: 'Inter',
    fontFamilyFallback: <String>['Noto Sans Khmer'],
    fontSize: 12,
    height: 16 / 12,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle labelMd = TextStyle(
    fontFamily: 'Inter',
    fontFamilyFallback: <String>['Noto Sans Khmer'],
    fontSize: 12,
    height: 16 / 12,
    letterSpacing: 0.24,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle labelSm = TextStyle(
    fontFamily: 'Inter',
    fontFamilyFallback: <String>['Noto Sans Khmer'],
    fontSize: 10,
    height: 14 / 10,
    letterSpacing: 0.4,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle currencyPrimary = TextStyle(
    fontFamily: 'Inter',
    fontFamilyFallback: <String>['Noto Sans Khmer'],
    fontSize: 22,
    height: 28 / 22,
    letterSpacing: -0.44,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle currencySecondary = TextStyle(
    fontFamily: 'Inter',
    fontFamilyFallback: <String>['Noto Sans Khmer'],
    fontSize: 14,
    height: 20 / 14,
    fontWeight: FontWeight.w500,
  );
}
