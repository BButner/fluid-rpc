import 'package:flutter/material.dart';
import 'package:frpc_gui/core/theme/fluid_colors.dart';

/// Theme for [Card]s.
class FluidCardTheme {
  /// The theme used for the [Card].
  static final cardTheme = CardTheme(
    color: FluidColors.zinc.shade900,
    margin: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6.0),
      side: BorderSide(
        color: FluidColors.zinc.shade800,
      ),
    ),
  );
}
