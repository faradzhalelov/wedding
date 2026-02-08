import 'package:flutter/material.dart';

/// Design tokens extracted from the HTML design files.
/// Single source of truth for all colors used across the app.
abstract final class AppColors {
  // Brand
  static const Color primary = Color(0xFFE6193C);
  static const Color primaryLight = Color(0xFFFCE8EB);
  static const Color primaryDark = Color(0xFFB81430);

  // Backgrounds
  static const Color backgroundLight = Color(0xFFF8F6F6);
  static const Color backgroundDark = Color(0xFF211114);
  static const Color surfaceWhite = Colors.white;
  static const Color surfaceDark = Color(0xFF2A171B);

  // Text
  static const Color textPrimary = Color(0xFF181112);
  static const Color textSecondary = Color(0xFF886369);
  static const Color textMuted = Color(0xFF9CA3AF);

  // Neutral
  static const Color neutralSoft = Color(0xFFE5DCDD);
  static const Color neutralBorder = Color(0xFFF4F0F1);
  static const Color neutral100 = Color(0xFFF5F5F5);
  static const Color neutral200 = Color(0xFFE5E7EB);
  static const Color neutral400 = Color(0xFF9CA3AF);
  static const Color neutral500 = Color(0xFF6B7280);
  static const Color neutral600 = Color(0xFF4B5563);

  // Semantic
  static const Color success = Color(0xFF16A34A);
}
