import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frpc_gui/features/environment/widgets/manage_environments_popup.dart';
import 'package:frpc_gui/features/projects/project_state_provider.dart';

class EnvironmentsDropdown extends ConsumerWidget {
  const EnvironmentsDropdown({
    required this.projectId,
    super.key,
  });

  final String projectId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectStateAsync = ref.watch(projectStateProvider.call(projectId));

    return projectStateAsync.when(
        data: (projectState) => Row(
              children: [
                Expanded(
                  child: DropdownMenu(
                    expandedInsets: EdgeInsets.zero,
                    initialSelection: projectState.selectedEnvironment,
                    onSelected: (env) {
                      if (env == null) return;

                      ref
                          .read(projectStateProvider.call(projectId).notifier)
                          .selectEnvironment(env.id);
                    },
                    dropdownMenuEntries: [
                      ...projectState.project.environments.map(
                        (e) => DropdownMenuEntry(
                          value: e,
                          label: e.displayName,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) =>
                          ManageEnvironmentsPopup(projectId: projectId),
                    );
                  },
                  icon: const Icon(Icons.more_vert_rounded),
                ),
              ],
            ),
        error: (error, stackTrace) => Text(
              error.toString(),
            ),
        loading: () => const CircularProgressIndicator(),);
  }
}
