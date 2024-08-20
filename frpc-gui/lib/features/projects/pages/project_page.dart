import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frpc_gui/features/environment/widgets/environments_dropdown.dart';
import 'package:frpc_gui/features/projects/project_state_provider.dart';
import 'package:frpc_gui/features/projects/widgets/rpc_tab_viewer.dart';
import 'package:frpc_gui/features/projects/widgets/rpc_tree.dart';

class ProjectPage extends ConsumerWidget {
  final String projectId;

  const ProjectPage({
    required this.projectId,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectState = ref.watch(projectStateProvider.call(projectId));

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {},
          child: const Text('Testing'),
        ),
        const SizedBox(height: 8.0),
        FilledButton(
          onPressed: () {},
          child: const Text('Testing'),
        ),
        const SizedBox(height: 8.0),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.add_rounded),
        ),
      ],
    );

    return LayoutBuilder(
      builder: (context, constraints) => Column(
        children: [
          Expanded(
            child: Row(
              children: [
                SizedBox(
                  width: constraints.maxWidth * 0.4,
                  child: Column(
                    children: [
                      EnvironmentsDropdown(
                        projectId: projectId,
                      ),
                      Expanded(
                        child: RpcTree(projectId: projectId),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: RpcTabViewer(projectId: projectId),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
