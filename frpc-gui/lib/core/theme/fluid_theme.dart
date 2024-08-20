import 'package:flutter/material.dart';
import 'package:frpc_gui/core/theme/fluid_colors.dart';

class FluidTheme {
  static final fluidTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: FluidColors.zinc[950],
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        side: BorderSide(
          width: 1.0,
          color: FluidColors.violet.shade500,
        ),
        foregroundColor: FluidColors.violet.shade100,
        backgroundColor: FluidColors.violet.shade600,
        padding: const EdgeInsets.all(8.0),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        side: BorderSide(
          width: 1.0,
          color: FluidColors.zinc.shade700,
        ),
        foregroundColor: FluidColors.zinc.shade50,
        backgroundColor: FluidColors.zinc.shade800,
        padding: const EdgeInsets.all(8.0),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.0),
        ),
        foregroundColor: FluidColors.zinc.shade300,
        backgroundColor: FluidColors.zinc.shade900,
        padding: const EdgeInsets.all(2.0),
      ),
    ),
    iconTheme: IconThemeData(
      color: FluidColors.zinc.shade200,
    ),
  );
}
