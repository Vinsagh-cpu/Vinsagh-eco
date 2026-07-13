import 'package:flutter/material.dart';

import 'vinsagh_colors.dart';

class VinsaghTheme {
  static ThemeData light() {
    final colorScheme =
        ColorScheme.fromSeed(
          seedColor: VinsaghColors.primary,
          brightness: Brightness.light,
        ).copyWith(
          primary: VinsaghColors.primary,
          onPrimary: Colors.white,
          primaryContainer: VinsaghColors.primaryContainer,
          onPrimaryContainer: VinsaghColors.textPrimary,
          secondary: VinsaghColors.secondary,
          onSecondary: Colors.white,
          secondaryContainer: VinsaghColors.secondaryContainer,
          onSecondaryContainer: VinsaghColors.textPrimary,
          tertiary: VinsaghColors.accent,
          onTertiary: VinsaghColors.textPrimary,
          tertiaryContainer: VinsaghColors.accentContainer,
          onTertiaryContainer: VinsaghColors.textPrimary,
          surface: VinsaghColors.surface,
          onSurface: VinsaghColors.textPrimary,
          surfaceContainerHighest: VinsaghColors.surfaceContainerHighest,
          surfaceTint: VinsaghColors.primary,
          outline: VinsaghColors.outline,
          outlineVariant: VinsaghColors.outlineVariant,
          error: VinsaghColors.pending,
          onError: Colors.white,
          inverseSurface: VinsaghColors.inverseSurface,
          onInverseSurface: VinsaghColors.inverseOnSurface,
          inversePrimary: VinsaghColors.primaryContainer,
        );

    final baseTextTheme = ThemeData.light().textTheme.apply(
      bodyColor: VinsaghColors.textPrimary,
      displayColor: VinsaghColors.textPrimary,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: VinsaghColors.background,
      iconTheme: const IconThemeData(color: VinsaghColors.primary),
      dividerTheme: const DividerThemeData(color: VinsaghColors.outlineVariant),
      textTheme: baseTextTheme.copyWith(
        headlineMedium: baseTextTheme.headlineMedium?.copyWith(
          fontWeight: FontWeight.w700,
          letterSpacing: 0,
          color: VinsaghColors.textPrimary,
        ),
        titleMedium: baseTextTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
          color: VinsaghColors.textPrimary,
        ),
        bodyMedium: baseTextTheme.bodyMedium?.copyWith(
          letterSpacing: 0,
          color: VinsaghColors.textSecondary,
        ),
        labelLarge: baseTextTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
          color: VinsaghColors.textPrimary,
        ),
      ),
    );
  }
}
