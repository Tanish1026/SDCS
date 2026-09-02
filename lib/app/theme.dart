import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  AppColors._();

  static const onPrimary = Color(0xFFFFFFFF);
  static const surfaceContainerLowest = Color(0xFFFFFFFF);
  static const onBackground = Color(0xFF191C1E);
  static const surfaceBright = Color(0xFFF7F9FC);
  static const primaryFixed = Color(0xFFD6E3FF);
  static const onSecondaryContainer = Color(0xFF683700);
  static const onSurfaceVariant = Color(0xFF44474E);
  static const outlineVariant = Color(0xFFC4C6CF);
  static const inverseOnSurface = Color(0xFFEFF1F4);
  static const tertiaryFixed = Color(0xFF8DFC75);
  static const surfaceContainerHighest = Color(0xFFE0E3E6);
  static const background = Color(0xFFF7F9FC);
  static const surfaceDim = Color(0xFFD8DADD);
  static const onSecondaryFixedVariant = Color(0xFF6D3A00);
  static const primary = Color(0xFF000A1E);
  static const secondary = Color(0xFF8F4E00);
  static const errorContainer = Color(0xFFFFDAD6);
  static const surfaceVariant = Color(0xFFE0E3E6);
  static const onTertiaryFixedVariant = Color(0xFF035300);
  static const surfaceTint = Color(0xFF465F88);
  static const error = Color(0xFFBA1A1A);
  static const primaryFixedDim = Color(0xFFAEC7F6);
  static const onErrorContainer = Color(0xFF93000A);
  static const surfaceContainerHigh = Color(0xFFE6E8EB);
  static const surfaceContainer = Color(0xFFECEEF1);
  static const outline = Color(0xFF74777F);
  static const onSecondaryFixed = Color(0xFF2E1500);
  static const onPrimaryFixedVariant = Color(0xFF2D476F);
  static const surfaceContainerLow = Color(0xFFF2F4F7);
  static const secondaryFixed = Color(0xFFFFDCC2);
  static const tertiaryFixedDim = Color(0xFF72DE5C);
  static const onSecondary = Color(0xFFFFFFFF);
  static const secondaryContainer = Color(0xFFFE9832);
  static const tertiary = Color(0xFF000E00);
  static const inversePrimary = Color(0xFFAEC7F6);
  static const primaryContainer = Color(0xFF002147);
  static const onPrimaryContainer = Color(0xFF708AB5);
  static const onPrimaryFixed = Color(0xFF001B3D);
  static const tertiaryContainer = Color(0xFF012800);
  static const onTertiary = Color(0xFFFFFFFF);
  static const surface = Color(0xFFF7F9FC);
  static const inverseSurface = Color(0xFF2D3133);
  static const secondaryFixedDim = Color(0xFFFFB77A);
  static const onTertiaryContainer = Color(0xFF309D22);
  static const onSurface = Color(0xFF191C1E);
  static const onError = Color(0xFFFFFFFF);
  static const onTertiaryFixed = Color(0xFF012200);
}

ThemeData buildAppTheme() {
  final textTheme = GoogleFonts.publicSansTextTheme();
  final bodyFont = GoogleFonts.atkinsonHyperlegibleTextTheme();

  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      primary: AppColors.primary,
      onPrimary: AppColors.onPrimary,
      secondary: AppColors.secondary,
      onSecondary: AppColors.onSecondary,
      surface: AppColors.surface,
      onSurface: AppColors.onSurface,
      error: AppColors.error,
      onError: AppColors.onError,
    ),
    textTheme: bodyFont.copyWith(
      headlineLarge: textTheme.headlineLarge?.copyWith(
        fontSize: 26,
        fontWeight: FontWeight.w700,
        height: 32 / 26,
        letterSpacing: -0.2,
        color: AppColors.onPrimary,
      ),
      headlineMedium: textTheme.headlineMedium?.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        height: 30 / 24,
        color: AppColors.primary,
      ),
      labelSmall: bodyFont.labelSmall?.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.1,
      ),
      labelLarge: textTheme.labelLarge?.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.2,
      ),
    ),
  );
}
