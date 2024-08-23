import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frpc_gui/core/controls/expansion_title.dart';
import 'package:frpc_gui/core/theme/fluid_colors.dart';
import 'package:frpc_gui/features/projects/project_state_provider.dart';
import 'package:frpc_gui/features/projects/projects_provider.dart';
import 'package:frpc_gui/features/projects/widgets/rpc_tree.dart';
import 'package:frpc_gui/src/rust/api/models/project/project.dart';
import 'package:go_router/go_router.dart';

class ProjectNavigationShell extends ConsumerWidget {
  const ProjectNavigationShell({
    required this.navigationShell,
    super.key,
  });

  static const double sidebarWidth = 200.0;

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
                                    PopupMenuButton(
                                      child: Row(
                                        children: [
                                          DecoratedBox(
                                            decoration: BoxDecoration(
                                              color:
                                                  FluidColors.violet.shade700,
                                              borderRadius:
                                                  BorderRadius.circular(6.0),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                Project.getDefaultAvatar(
                                                  displayName: currentProject
                                                      .project.displayName,
                                                ),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                      fontWeight:
                                                          FontWeight.w600,
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
                                      onSelected: (project) {
                                        final index = projects.indexOf(project);

                                        _goBranch(index);
                                      },
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
                                    ),
                                    const Spacer(),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.refresh_rounded),
                                    ),
                                  ],
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
                                )
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
                loading: () => const CircularProgressIndicator());
          },
          error: (error, stackTrace) => Text(
                error.toString(),
              ),
          loading: () => const CircularProgressIndicator()),
    );
  }
}
