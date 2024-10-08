import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frpc_gui/core/theme/fluid_colors.dart';
import 'package:frpc_gui/features/projects/project_state_provider.dart';
import 'package:frpc_gui/features/projects/projects_provider.dart';
import 'package:frpc_gui/features/projects/widgets/rpc_tree.dart';
import 'package:frpc_gui/features/projects/widgets/selected_environment_dropdown.dart';
import 'package:frpc_gui/src/rust/api/models/project/project.dart';
import 'package:go_router/go_router.dart';

/// Shell page for a project.
class ProjectNavigationShell extends ConsumerWidget {
  /// Creates a new [ProjectNavigationShell].
  const ProjectNavigationShell({
    required this.navigationShell,
    super.key,
  });

  /// The navigation shell from the router.
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectsAsync = ref.watch(projectsProvider);

    return Scaffold(
      body: projectsAsync.when(
        data: (projects) {
          final currentProject = projects[navigationShell.currentIndex];

          final projectStateAsync =
              ref.watch(projectStateProvider.call(currentProject.project.id));

          return projectStateAsync.when(
            data: (projectState) => Row(
              children: [
                SizedBox(
                  width: 280.0,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(
                      8.0,
                      8.0,
                      0.0,
                      8.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: PopupMenuButton(
                                onSelected: (project) {
                                  final index = projects.indexOf(project);

                                  _goBranch(index);
                                },
                                popUpAnimationStyle: AnimationStyle(
                                  duration: const Duration(milliseconds: 150),
                                ),
                                itemBuilder: (context) => projects
                                    .map(
                                      (p) => PopupMenuItem(
                                        value: p,
                                        child: Text(
                                          p.project.displayName,
                                        ),
                                      ),
                                    )
                                    .toList(),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 40.0,
                                      height: 40.0,
                                      child: Card(
                                        color: FluidColors.zinc[1000],
                                        surfaceTintColor:
                                            FluidColors.violet.shade600,
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            color: FluidColors.violet.shade600,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(6.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Center(
                                            child: Text(
                                              Project.getDefaultAvatar(
                                                displayName: currentProject
                                                    .project.displayName,
                                              ),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium!
                                                  .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    color: FluidColors
                                                        .violet.shade300,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8.0),
                                    Text(
                                      currentProject.project.displayName,
                                    ),
                                    const Icon(
                                      Icons.arrow_drop_down_rounded,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                await ref
                                    .read(
                                      projectStateProvider
                                          .call(currentProject.project.id)
                                          .notifier,
                                    )
                                    .refreshImportData();
                              },
                              icon: const Icon(Icons.refresh_rounded),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.eco_rounded,
                                size: 14.0,
                                color: FluidColors.zinc.shade400,
                              ),
                              const SizedBox(width: 8.0),
                              Expanded(
                                child: Text(
                                  'Environment',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(
                                        color: FluidColors.zinc.shade400,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SelectedEnvironmentDropdown(
                          projectId: projectState.project.id,
                        ),
                        const SizedBox(height: 16.0),
                        Expanded(
                          child: ListView(
                            padding: EdgeInsets.zero,
                            children: [
                              RpcTree(
                                projectId: projectState.project.id,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: navigationShell,
                  ),
                ),
              ],
            ),
            error: (error, stackTrace) => Text(
              error.toString(),
            ),
            loading: () => const CircularProgressIndicator(),
          );
        },
        error: (error, stackTrace) => Text(
          error.toString(),
        ),
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}
