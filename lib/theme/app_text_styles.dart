import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

/// Typography tokens.
/// Manrope for body/UI, Playfair Display for editorial/hero titles.
abstract final class AppTextStyles {
  // -- Serif (Playfair Display) — used sparingly for hero titles --

  static TextStyle heroDisplay = GoogleFonts.playfairDisplay(
    fontSize: 96,
    fontWeight: FontWeight.w500,
    height: 0.9,
    letterSpacing: -2,
    color: AppColors.textPrimary,
  );

  static TextStyle heroDisplayMobile = GoogleFonts.playfairDisplay(
    fontSize: 56,
    fontWeight: FontWeight.w500,
    height: 0.9,
    letterSpacing: -1.5,
    color: AppColors.textPrimary,
  );

  static TextStyle sectionSerif = GoogleFonts.playfairDisplay(
    fontSize: 48,
    fontWeight: FontWeight.w500,
    height: 1.1,
    color: AppColors.textPrimary,
  );

  // -- Sans-serif (Manrope) — primary font for everything else --

  static TextStyle heading1 = GoogleFonts.manrope(
    fontSize: 72,
    fontWeight: FontWeight.w800,
    height: 0.9,
    letterSpacing: -2,
    color: AppColors.textPrimary,
  );

  static TextStyle heading2 = GoogleFonts.manrope(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    height: 1.2,
    letterSpacing: -0.5,
    color: AppColors.textPrimary,
  );

  static TextStyle heading3 = GoogleFonts.manrope(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    height: 1.3,
    color: AppColors.textPrimary,
  );

  static TextStyle bodyLarge = GoogleFonts.manrope(
    fontSize: 18,
    fontWeight: FontWeight.w300,
    height: 1.6,
    color: AppColors.neutral600,
  );

  static TextStyle body = GoogleFonts.manrope(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: AppColors.neutral600,
  );

  static TextStyle bodySmall = GoogleFonts.manrope(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.4,
    color: AppColors.neutral500,
  );

  static TextStyle label = GoogleFonts.manrope(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    height: 1.2,
    letterSpacing: 2,
    color: AppColors.primary,
  );

  static TextStyle navLink = GoogleFonts.manrope(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    height: 1.0,
    letterSpacing: 1.5,
    color: AppColors.textPrimary,
  );

  static TextStyle button = GoogleFonts.manrope(
    fontSize: 13,
    fontWeight: FontWeight.w700,
    height: 1.0,
    letterSpacing: 1.5,
    color: Colors.white,
  );
}
