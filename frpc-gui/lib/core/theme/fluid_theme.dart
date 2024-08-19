import 'package:flutter/material.dart';

class FluidTheme {
  static final purple = MaterialColor(
    const Color(0xFF932BE3).value,
    const {
      50: Color(0xFFE4CAF8),
      100: Color(0xFFD4AAF4),
      200: Color(0xFFC48AF0),
      300: Color(0xFFB36BEB),
      400: Color(0xFFA34BE7),
      500: Color(0xFF932BE3), // Primary
      600: Color(0xFF7D25C1),
      700: Color(0xFF671E9F),
      800: Color(0xFF3B115B),
      900: Color(0xFF0F0417),
      1000: Color(0xFF020103),
    },
  );

  static final fluidTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: purple[1000],
  );
}
