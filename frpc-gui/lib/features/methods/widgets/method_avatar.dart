import 'package:flutter/material.dart';
import 'package:frpc_gui/core/theme/fluid_colors.dart';

/// Displays the avatar for a method.
class MethodAvatar extends StatelessWidget {
  /// Creates a new [MethodAvatar].
  const MethodAvatar({
    required this.isStreaming,
    super.key,
  });

  /// Whether the method is streaming or not.
  final bool isStreaming;

  static const MaterialColor _unaryColor = FluidColors.emerald;
  static const MaterialColor _streamingColor = FluidColors.sky;

  @override
  Widget build(BuildContext context) {
    final color = isStreaming ? _streamingColor : _unaryColor;

    return SizedBox(
      width: 28.0,
      height: 28.0,
      child: Card(
        color: FluidColors.zinc[1000],
        surfaceTintColor: color.shade600,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: color.shade600,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Center(
          child: Text(
            isStreaming ? 'S' : 'U',
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: color.shade300,
                ),
          ),
        ),
      ),
    );
  }
}
