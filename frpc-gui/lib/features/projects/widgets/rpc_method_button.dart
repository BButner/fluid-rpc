import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frpc_gui/core/theme/fluid_colors.dart';
import 'package:frpc_gui/features/projects/project_tab_controller_provider.dart';
import 'package:frpc_gui/features/projects/widgets/method_avatar.dart';
import 'package:frpc_gui/src/rust/api/models/descriptors/method_descriptor.dart';

/// Button for a method in the sidebar, used to open or select a tab.
class RpcMethodButton extends ConsumerWidget {
  /// Creates a new [RpcMethodButton].
  const RpcMethodButton({
    required this.projectId,
    required this.method,
    super.key,
  });

  /// The project id this button belongs to.
  final String projectId;

  /// The [MethodDescriptor] this button belongs to.
  final MethodDescriptor method;

  @override
  Widget build(BuildContext context, WidgetRef ref) => MaterialButton(
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
