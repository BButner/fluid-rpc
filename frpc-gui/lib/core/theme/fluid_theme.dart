import 'package:flutter/material.dart';
import 'package:frpc_gui/core/theme/controls/buttons.dart';
import 'package:frpc_gui/core/theme/controls/card_theme.dart';
import 'package:frpc_gui/core/theme/controls/dropdown_menu.dart';
import 'package:frpc_gui/core/theme/controls/expansion_tile.dart';
import 'package:frpc_gui/core/theme/fluid_colors.dart';

class FluidTheme {
  static final fluidTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
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
  );
}
