import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frpc_gui/features/projects/projects_provider.dart';
import 'package:frpc_gui/features/projects/widgets/create_project_popup.dart';
import 'package:frpc_gui/features/projects/widgets/project_nav_button.dart';
import 'package:go_router/go_router.dart';

class ProjectNavigationShell extends ConsumerWidget {
  const ProjectNavigationShell({
    required this.navigationShell,
    super.key,
  });

  static const double sidebarWidth = 64.0;

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
          data: (projects) => Row(
                children: [
                  ColoredBox(
                    color: Theme.of(context).colorScheme.tertiaryContainer,
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
                                  builder: (context) => CreateProjectPopup(),
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
