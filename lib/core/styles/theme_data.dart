import 'package:flutter/material.dart';
import 'package:shop_app_clean/core/styles/colors.dart';

class Themes {
  static ThemeData mainTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme(
      // Primary colors
      primary: CustomColors.PRIMARY,
      onPrimary: CustomColors.ON_PRIMARY,
      primaryContainer: CustomColors.PRIMARY_VARIANT,
      onPrimaryContainer: CustomColors.ON_PRIMARY,

      // Secondary colors
      secondary: CustomColors.SECONDARY,
      onSecondary: CustomColors.ON_SECONDARY,
      secondaryContainer: CustomColors.SECONDARY_VARIANT,
      onSecondaryContainer: CustomColors.ON_SECONDARY,

      // Surface colors
      surface: CustomColors.SURFACE,
      onSurface: CustomColors.ON_SURFACE,
      surfaceTint: CustomColors.PRIMARY.withOpacity(0.05),

      // Background colors
      background: CustomColors.BACKGROUND,
      onBackground: CustomColors.ON_BACKGROUND,

      // Error colors
      error: CustomColors.ERROR,
      onError: CustomColors.ON_ERROR,

      // Required brightness parameter
      brightness: Brightness.light,
    ),

    // AppBar theme
    appBarTheme: AppBarTheme(
      backgroundColor: CustomColors.PRIMARY,
      foregroundColor: CustomColors.ON_PRIMARY,
      elevation: 0,
    ),

    // Elevated Button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: CustomColors.ON_PRIMARY,
        backgroundColor: CustomColors.PRIMARY,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),

    // Input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: CustomColors.SURFACE,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: CustomColors.PRIMARY_VARIANT),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: CustomColors.PRIMARY, width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide:
            BorderSide(color: CustomColors.PRIMARY_VARIANT.withOpacity(0.5)),
      ),
    ),

    // Text Button theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: CustomColors.SECONDARY,
      ),
    ),

    // General text theme
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: CustomColors.ON_BACKGROUND),
      bodyMedium: TextStyle(color: CustomColors.ON_BACKGROUND),
    ),
  );
}
