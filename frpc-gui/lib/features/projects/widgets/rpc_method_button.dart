import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frpc_gui/core/theme/fluid_colors.dart';
import 'package:frpc_gui/features/projects/project_tab_controller_provider.dart';
import 'package:frpc_gui/features/projects/widgets/method_avatar.dart';
import 'package:frpc_gui/src/rust/api/models/descriptors/method_descriptor.dart';

class RpcMethodButton extends ConsumerWidget {
  const RpcMethodButton({
    required this.projectId,
    required this.method,
    super.key,
  });

  final String projectId;

  final MethodDescriptor method;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialButton(
      onPressed: () {
        ref
            .read(projectTabControllerProvider.call(projectId).notifier)
            .openOrActivateTab(method);
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      hoverColor: FluidColors.zinc.shade800,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          children: [
            MethodAvatar(isStreaming: method.isServerStreaming),
            const SizedBox(width: 8.0),
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
