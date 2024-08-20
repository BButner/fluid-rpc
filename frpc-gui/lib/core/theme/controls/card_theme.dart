import 'package:flutter/material.dart';
import 'package:frpc_gui/core/theme/fluid_colors.dart';

class FluidCardTheme {
  static final cardTheme = CardTheme(
    color: FluidColors.zinc.shade900,
    margin: EdgeInsets.zero,
    surfaceTintColor: null,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6.0),
      side: BorderSide(
        color: FluidColors.zinc.shade800,
      ),
    ),
  );
}
