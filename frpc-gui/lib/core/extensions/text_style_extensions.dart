import 'package:flutter/material.dart';

/// Extensions for the [TextStyle] class.
extension TextStyleExtensions on TextStyle? {
  /// Sets the font weight to [FontWeight.normal].
  TextStyle? get normal => this?.copyWith(fontWeight: FontWeight.normal);

  /// Sets the font weight to [FontWeight.w600].
  TextStyle? get semibold => this?.copyWith(fontWeight: FontWeight.w600);

  /// Sets the font weight to [FontWeight.bold].
  TextStyle? get bold => this?.copyWith(fontWeight: FontWeight.bold);

  /// Sets the font style to [FontStyle.italic].
  TextStyle? get italic => this?.copyWith(fontStyle: FontStyle.italic);

  /// Sets the specified [Color].
  TextStyle? withColor(Color color) => this?.copyWith(color: color);

  /// Sets the color to the primary color.
  TextStyle? primary(BuildContext context) =>
      this?.copyWith(color: Theme.of(context).colorScheme.primary);

  /// Sets the color to the secondary color.
  TextStyle? secondary(BuildContext context) =>
      this?.copyWith(color: Theme.of(context).colorScheme.secondary);

  /// Sets the color to the tertiary color.
  TextStyle? tertiary(BuildContext context) =>
      this?.copyWith(color: Theme.of(context).colorScheme.tertiary);

  /// Sets the color to the error color.
  TextStyle? error(BuildContext context) =>
      this?.copyWith(color: Theme.of(context).colorScheme.error);
}
