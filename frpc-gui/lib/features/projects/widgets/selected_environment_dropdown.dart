import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frpc_gui/features/projects/project_state_provider.dart';

/// Dropdown to select the current environment.
class SelectedEnvironmentDropdown extends ConsumerWidget {
  /// Creates a new [SelectedEnvironmentDropdown].
  const SelectedEnvironmentDropdown({
    required this.projectId,
    super.key,
  });

  /// The id of the project this belongs to.
  final String projectId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectStateAsync = ref.watch(projectStateProvider.call(projectId));

    return projectStateAsync.when(
      data: (projectState) => PopupMenuButton(
        position: PopupMenuPosition.under,
        onSelected: (env) {
          ref
              .read(projectStateProvider.call(projectId).notifier)
              .selectEnvironment(env.id);
        },
        itemBuilder: (context) => projectState.project.environments
            .map(
              (e) => PopupMenuItem(
                value: e,
                child: Text(e.displayName),
              ),
            )
            .toList(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                projectState.selectedEnvironment?.displayName ?? 'NO ENV',
              ),
              const Icon(
                Icons.arrow_drop_down_rounded,
              ),
            ],
          ),
        ),
      ),
      error: (error, stackTrace) => Text(
        error.toString(),
      ),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
