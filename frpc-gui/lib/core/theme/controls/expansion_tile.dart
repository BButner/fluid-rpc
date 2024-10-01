import 'package:flutter/material.dart';

/// Theme related to the [ExpensionTile].
class FluidExpansionTileTheme {
  /// The theme for the [ExpansionTile].
  static final expansionTileTheme = ExpansionTileThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.0),
    ),
    collapsedShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.0),
    ),
    tilePadding: const EdgeInsets.symmetric(
      horizontal: 6.0,
      vertical: 4.0,
    ),
  );
}
