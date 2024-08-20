import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frpc_gui/core/theme/fluid_colors.dart';
import 'package:frpc_gui/features/projects/projects_provider.dart';
import 'package:frpc_gui/features/projects/widgets/create_project_popup.dart';
import 'package:frpc_gui/features/projects/widgets/project_nav_button.dart';
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
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Text(
                        currentProject.project.displayName,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: FluidColors.zinc.shade900,
                        borderRadius: BorderRadius.circular(6.0),
                        border: Border.all(
                          //color: const Color(0xFF27272A),
                          color: FluidColors.zinc.shade800,
                        ),
                      ),
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
