import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frpc_gui/features/environment/widgets/environments_dropdown.dart';
import 'package:frpc_gui/features/projects/widgets/rpc_tree.dart';

class ProjectPage extends ConsumerWidget {
  final String projectId;

  const ProjectPage({
    required this.projectId,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                      EnvironmentsDropdown(),
                      const Expanded(
                        child: RpcTree(),
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  child: Text('This is where the content will go...'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
