import 'package:coffee_app_new/utils/colors.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// The [AppTheme] defines light and dark themes for the app.
///
/// Theme setup for FlexColorScheme package v8.
/// Use same major flex_color_scheme package version. If you use a
/// lower minor version, some properties may not be supported.
/// In that case, remove them after copying this theme to your
/// app or upgrade the package to version 8.2.0.
///
/// Use it in a [MaterialApp] like this:
///
/// MaterialApp(
///   theme: AppTheme.light,
///   darkTheme: AppTheme.dark,
/// );
abstract final class AppTheme {
  // The FlexColorScheme defined light mode ThemeData.
  static ThemeData light = FlexThemeData.light(
    // User defined custom colors made with FlexSchemeColor() API.
    colors: const FlexSchemeColor(
      primary: primaryColor,
      primaryContainer: splashBgColor,
      secondary: Color(0xFFF1F5F9),
      secondaryContainer: Color(0xFFD4E3FF),
      tertiary: Color(0xFFF1F5F9),
      tertiaryContainer: Color(0xFFFFFFFF),
      appBarColor: Color(0xFFF1F5F9),
      error: Color(0xFFEF4444),
      errorContainer: Color(0xFFFFE6E6),
    ),
    // Component theme configurations for light mode.
    subThemesData: const FlexSubThemesData(
      interactionEffects: true,
      tintedDisabledControls: true,
      useM2StyleDividerInM3: true,
      inputDecoratorIsFilled: true,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      alignedDropdown: true,
      navigationRailUseIndicator: true,
      scaffoldBackgroundSchemeColor: SchemeColor.surfaceContainerLowest,
      searchBarBackgroundSchemeColor: SchemeColor.surfaceContainerLowest,
    ),
    // Direct ThemeData properties.
    fontFamily: GoogleFonts.sora().fontFamily,
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      brightness: Brightness.light,
    ),
    textTheme: GoogleFonts.soraTextTheme(),
  );

  // The FlexColorScheme defined dark mode ThemeData.
  static ThemeData dark = FlexThemeData.dark(
    // User defined custom colors made with FlexSchemeColor() API.
    colors: const FlexSchemeColor(
      primary: primaryColor,
      primaryContainer:splashBgColor,
      primaryLightRef: splashBgColor, // The color of light mode primary
      secondary: Color(0xFF1E293B),
      secondaryContainer: Color(0xFF1E293B),
      secondaryLightRef: Color(0xFFF1F5F9), // The color of light mode secondary
      tertiary: Color(0xFF1E293B),
      tertiaryContainer: Color(0xFF272727),
      tertiaryLightRef: Color(0xFFF1F5F9), // The color of light mode tertiary
      appBarColor: Color(0xFFF1F5F9),
      error: Color(0xFF7F1D1D),
      errorContainer: Color(0xFF410F0F),
    ),
    // Component theme configurations for dark mode.
    subThemesData: const FlexSubThemesData(
      interactionEffects: true,
      tintedDisabledControls: true,
      blendOnColors: true,
      useM2StyleDividerInM3: true,
      inputDecoratorIsFilled: true,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      alignedDropdown: true,
      navigationRailUseIndicator: true,
      scaffoldBackgroundSchemeColor: SchemeColor.surfaceContainerHigh,
      drawerBackgroundSchemeColor: SchemeColor.surfaceContainerHigh,
      bottomSheetBackgroundColor: SchemeColor.tertiaryContainer,
      dialogBackgroundSchemeColor: SchemeColor.tertiaryContainer,
      searchBarBackgroundSchemeColor: SchemeColor.surfaceContainer,
    ),

    // Direct ThemeData properties.
    fontFamily: GoogleFonts.sora().fontFamily,
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      brightness: Brightness.light,
    ),
    textTheme: GoogleFonts.soraTextTheme(),
  );
}
