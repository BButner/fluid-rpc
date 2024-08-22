import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frpc_gui/core/theme/fluid_colors.dart';
import 'package:frpc_gui/src/rust/api/models/descriptors/method_descriptor.dart';

class RpcMethodButton extends ConsumerWidget {
  const RpcMethodButton({
    required this.method,
    super.key,
  });

  final MethodDescriptor method;

  static const MaterialColor _unaryColor = FluidColors.emerald;
  static const MaterialColor _streamingColor = FluidColors.sky;

  Widget _methodAvatar(BuildContext context) {
    final color = method.isServerStreaming ? _streamingColor : _unaryColor;
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
              method.isServerStreaming ? 'S' : 'U',
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialButton(
      onPressed: () {},
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      hoverColor: FluidColors.zinc.shade800,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          children: [
            _methodAvatar(context),
            const SizedBox(
              width: 8.0,
            ),
            Expanded(
              child: Text(
                method.name,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
