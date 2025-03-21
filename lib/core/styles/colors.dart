// ignore_for_file: constant_identifier_names

import 'dart:ui';

class CustomColors {
  // Primary colors
  static const Color PRIMARY = Color(
      0xFF2E3138); // Dark Charcoal - App bars, buttons, selected items, progress indicators, anything that should draw user's attention
  static const Color PRIMARY_VARIANT = Color(
      0xFF4A4E57); // Medium Grey - Used for status bar, darker shade of primary color

  // Secondary colors
  static const Color SECONDARY = Color(
      0xFF64B5F6); // Light Blue - Floating action buttons, selection controls, highlights
  static const Color SECONDARY_VARIANT =
      Color(0xFF90CAF9); // Lighter Blue - Accent elements, secondary actions

  // Background colors
  static const Color BACKGROUND =
      Color(0xFFECEFF1); // Light Grey-Blue - App background
  static const Color SURFACE =
      Color(0xFFFFFFFF); // White - Cards, sheets, menus

  // Feedback colors
  static const Color ERROR =
      Color(0xFFE57373); // Soft Red - Error messages, alerts

  // "On" colors - used for text/icons that appear on top of the main colors
  static const Color ON_PRIMARY =
      Color(0xFFFFFFFF); // White - Text/icons on primary color
  static const Color ON_SECONDARY =
      Color(0xFF000000); // Black - Text/icons on secondary color
  static const Color ON_BACKGROUND =
      Color(0xFF212121); // Dark Grey - Text/icons on background
  static const Color ON_SURFACE =
      Color(0xFF212121); // Dark Grey - Text/icons on surface
  static const Color ON_ERROR =
      Color(0xFFFFFFFF); // White - Text/icons on error color
}
