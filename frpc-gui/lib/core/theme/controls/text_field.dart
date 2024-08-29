import 'package:flutter/material.dart';
import 'package:frpc_gui/core/theme/fluid_colors.dart';

/// Theme for [TexTextField].
class FluidTextFieldThemes {
  /// The [InputDecorationTheme] for [TextField], [TextFormField], etc.
  static final inputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.0),
      borderSide: BorderSide(
        color: FluidColors.zinc.shade600,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.0),
      borderSide: BorderSide(
        color: FluidColors.violet.shade400,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.0),
      borderSide: BorderSide(
        color: FluidColors.red.shade600,
      ),
    ),
    filled: true,
    fillColor: FluidColors.zinc.shade800,
    contentPadding: const EdgeInsets.symmetric(
      vertical: 8.0,
      horizontal: 12.0,
    ),
  );

  /// The [TextSelectionThemeData] for all related text fields.
  static final textSelectionTheme = TextSelectionThemeData(
    cursorColor: FluidColors.zinc.shade200,
    selectionHandleColor: FluidColors.violet.shade500,
    selectionColor: FluidColors.violet.shade500.withOpacity(0.4),
  );
}
