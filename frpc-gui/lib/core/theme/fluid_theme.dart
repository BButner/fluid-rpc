import 'package:flutter/material.dart';
import 'package:frpc_gui/core/theme/controls/buttons.dart';
import 'package:frpc_gui/core/theme/controls/card_theme.dart';
import 'package:frpc_gui/core/theme/controls/dropdown_menu.dart';
import 'package:frpc_gui/core/theme/controls/expansion_tile.dart';
import 'package:frpc_gui/core/theme/controls/text_field.dart';
import 'package:frpc_gui/core/theme/fluid_colors.dart';

/// The app theme.
class FluidTheme {
  /// Defines the [ThemeData] for the app.
  static final _fluidTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: FluidColors.zinc.shade900,
      primary: FluidColors.zinc.shade50,
      secondary: FluidColors.zinc.shade200,
      tertiary: FluidColors.zinc.shade400,
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: FluidColors.zinc[950],
    cardTheme: FluidCardTheme.cardTheme,
    elevatedButtonTheme: ButtonThemes.elevatedButtonTheme,
    filledButtonTheme: ButtonThemes.filledButtonTheme,
    iconButtonTheme: ButtonThemes.iconButtonTheme,
    iconTheme: IconThemeData(
      color: FluidColors.zinc.shade200,
    ),
    expansionTileTheme: FluidExpansionTileTheme.expansionTileTheme,
    dropdownMenuTheme: FluidDropdownMenuTheme.dropdownMenuTheme,
    popupMenuTheme: ButtonThemes.popupMenuButton,
    inputDecorationTheme: FluidTextFieldThemes.inputDecorationTheme,
    textSelectionTheme: FluidTextFieldThemes.textSelectionTheme,
  );

  /// Builds the theme.
  static ThemeData build() {
    final theme = _fluidTheme;
    final themeWithFonts = _buildFonts(theme);

    return themeWithFonts;
  }

  static ThemeData _buildFonts(ThemeData theme) {
    final base = theme.textTheme;

    final secondaryColor = theme.colorScheme.secondary;

    return theme.copyWith(
      textTheme: base.copyWith(
        displayLarge: base.displayLarge?.copyWith(
          fontSize: 34.0,
          fontWeight: FontWeight.w400,
        ),
        displayMedium: base.displayMedium?.copyWith(
          fontSize: 28.0,
          fontWeight: FontWeight.w400,
        ),
        displaySmall: base.displaySmall?.copyWith(
          fontSize: 22.0,
          fontWeight: FontWeight.w400,
        ),
        headlineLarge: base.headlineLarge?.copyWith(
          fontSize: 28.0,
          fontWeight: FontWeight.w700,
        ),
        headlineMedium: base.headlineMedium?.copyWith(
          fontSize: 22.0,
          fontWeight: FontWeight.w700,
        ),
        headlineSmall: base.headlineSmall?.copyWith(
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
        ),
        titleLarge: base.titleLarge?.copyWith(
          fontSize: 20.0,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: base.titleMedium?.copyWith(
          fontSize: 17.0,
          fontWeight: FontWeight.w600,
        ),
        titleSmall: base.titleSmall?.copyWith(
          fontSize: 15.0,
          fontWeight: FontWeight.w600,
          color: secondaryColor,
        ),
        bodyLarge: base.bodyLarge?.copyWith(
          fontSize: 17.0,
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: base.bodyMedium?.copyWith(
          fontSize: 17.0,
          fontWeight: FontWeight.w400,
        ),
        bodySmall: base.bodySmall?.copyWith(
          fontSize: 15.0,
          fontWeight: FontWeight.w400,
          color: secondaryColor,
        ),
        labelLarge: base.labelLarge?.copyWith(
          fontSize: 17.0,
          fontWeight: FontWeight.w500,
          color: secondaryColor,
        ),
        labelMedium: base.labelMedium?.copyWith(
          fontSize: 13.0,
          fontWeight: FontWeight.w500,
          color: secondaryColor,
        ),
        labelSmall: base.labelSmall?.copyWith(
          fontSize: 11.0,
          fontWeight: FontWeight.w500,
          color: secondaryColor,
        ),
      ),
    );
  }
}
