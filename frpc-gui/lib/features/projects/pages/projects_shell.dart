import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frpc_gui/core/theme/fluid_colors.dart';
import 'package:frpc_gui/features/projects/projects_provider.dart';
import 'package:frpc_gui/features/projects/widgets/create_project_popup.dart';
import 'package:frpc_gui/features/projects/widgets/project_nav_button.dart';
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

            return Row(
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
                      children: [
                        DropdownMenu(
                          expandedInsets: EdgeInsets.zero,
                          initialSelection: currentProject,
                          onSelected: (project) {
                            if (project == null) return;

                            final index = projects.indexOf(project);

                            _goBranch(index);
                          },
                          dropdownMenuEntries: projects
                              .map((p) => DropdownMenuEntry(
                                    value: p,
                                    label: p.project.displayName,
                                  ))
                              .toList(),
                        ),
                        const SizedBox(height: 8.0),
                        
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: navigationShell,
                    ),
                  ),
                ),
              ],
            );
          },
          error: (error, stackTrace) => Text(
                error.toString(),
              ),
          loading: () => const CircularProgressIndicator()),
    );

    return Scaffold(
      body: projectsAsync.when(
          data: (projects) => Row(
                children: [
                  DecoratedBox(
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          width: 2.0,
                          color: Color(0xFF383141),
                        ),
                      ),
                    ),
                    child: SizedBox(
                      width: sidebarWidth,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            for (int i = 0; i < projects.length; i++)
                              ProjectNavButton(
                                project: projects[i].project,
                                index: i,
                                goBranch: _goBranch,
                              ),
                            IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) =>
                                      const CreateProjectPopup(),
                                );
                              },
                              icon: const Icon(
                                Icons.add_rounded,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: navigationShell,
                  ),
                ],
              ),
          error: (error, stackTrace) => Text(
                error.toString(),
              ),
          loading: () => const CircularProgressIndicator()),
    );
  }
}
