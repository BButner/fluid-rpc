import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frpc_gui/core/controls/expansion_title.dart';
import 'package:frpc_gui/core/theme/fluid_colors.dart';
import 'package:frpc_gui/features/projects/project_state_provider.dart';
import 'package:frpc_gui/features/projects/widgets/rpc_method_button.dart';

/// Displays the services and methods of the specified project.
class RpcTree extends ConsumerStatefulWidget {
  /// Creates a new [RpcTree].
  const RpcTree({
    required this.projectId,
    super.key,
  });

  /// The project id to display.
  final String projectId;

  @override
  ConsumerState<RpcTree> createState() => _RpcTreeState();
}

class _RpcTreeState extends ConsumerState<RpcTree> {
  @override
  Widget build(BuildContext context) {
    final projectStateAsync =
        ref.watch(projectStateProvider.call(widget.projectId));

    return projectStateAsync.when(
      data: (projectState) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.dns_rounded,
                  size: 14.0,
                  color: FluidColors.zinc.shade400,
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Text(
                    'Services',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: FluidColors.zinc.shade400,
                        ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4.0),
          Column(
            children: [
              if (projectState.serverDescriptor != null)
                for (final s in projectState.serverDescriptor!.services
                    .sortedBy((s) => s.name))
                  ExpansionTitle(
                    title: s.name,
                    children: s.methods
                        .sortedBy((m) => m.name)
                        .map(
                          (m) => RpcMethodButton(
                            projectId: widget.projectId,
                            method: m,
                          ),
                        )
                        .toList(),
                  ),
            ],
          ),
        ],
      ),
      error: (error, stackTrace) => Text(
        error.toString(),
      ),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
