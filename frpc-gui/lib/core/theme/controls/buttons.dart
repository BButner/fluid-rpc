import 'package:flutter/material.dart';
import 'package:frpc_gui/core/theme/fluid_colors.dart';

/// The themes for the buttons.
class ButtonThemes {
  /// Theme for [ElevatedButton].
  static final elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      side: BorderSide(
        color: FluidColors.violet.shade500,
      ),
      foregroundColor: FluidColors.violet.shade100,
      backgroundColor: FluidColors.violet.shade600,
      padding: const EdgeInsets.all(8.0),
    ),
  );

  /// Theme for [FilledButton].
  static final filledButtonTheme = FilledButtonThemeData(
    style: FilledButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      side: BorderSide(
        color: FluidColors.zinc.shade700,
      ),
      foregroundColor: FluidColors.zinc.shade50,
      backgroundColor: FluidColors.zinc.shade800,
      padding: const EdgeInsets.all(8.0),
    ),
  );

  /// Theme for [IconButton].
  static final iconButtonTheme = IconButtonThemeData(
    style: IconButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      backgroundColor: FluidColors.zinc.shade800,
      foregroundColor: FluidColors.zinc.shade300,
      padding: const EdgeInsets.all(2.0),
      iconSize: 18.0,
    ),
  );

  /// Theme for [PopupMenuButton].
  static final popupMenuButton = PopupMenuThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.0),
    ),
  );
}
