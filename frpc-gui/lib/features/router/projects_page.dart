import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frpc_gui/features/projects/projects_provider.dart';
import 'package:frpc_gui/features/projects/widgets/create_project_popup.dart';
import 'package:frpc_gui/src/rust/api/models/project/project.dart';

@RoutePage()
class ProjectsPage extends ConsumerWidget {
  const ProjectsPage({
    super.key,
  });

  static const double sidebarWidth = 64.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projects = ref.watch(projectsProvider);

    return Scaffold(
      body: projects.when(
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
                            for (final project in projects)
                              ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  Project.getDefaultAvatar(
                                    displayName: project.project.displayName,
                                  ),
                                ),
                              ),
                            // IconButton(
                            //   onPressed: () {},
                            //   icon: const Icon(
                            //     Icons.ac_unit,
                            //   ),
                            // ),
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
                    child: AutoRouter(),
                  ),
                ],
              ),
          error: (error, stackTrace) => Text(
                error.toString(),
              ),
          loading: () => CircularProgressIndicator()),
    );
  }
}
