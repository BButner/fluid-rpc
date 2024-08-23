import 'package:flutter/material.dart';
import 'package:frpc_gui/core/theme/fluid_colors.dart';

class MethodAvatar extends StatelessWidget {
  const MethodAvatar({
    required this.isStreaming,
    super.key,
  });

  final bool isStreaming;

  static const MaterialColor _unaryColor = FluidColors.emerald;
  static const MaterialColor _streamingColor = FluidColors.sky;

  @override
  Widget build(BuildContext context) {
    final color = isStreaming ? _streamingColor : _unaryColor;

    return SizedBox(
      width: 30.0,
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              isStreaming ? 'S' : 'U',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: color.shade300,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
