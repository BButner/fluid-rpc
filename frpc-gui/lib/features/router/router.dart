import 'package:frpc_gui/features/projects/pages/no_project_page.dart';
import 'package:frpc_gui/features/projects/pages/project_page.dart';
import 'package:frpc_gui/features/projects/pages/projects_shell.dart';
import 'package:frpc_gui/features/projects/projects_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

/// The [FluidRpcRouter] for the application.
@riverpod
Future<GoRouter> fluidRpcRouter(FluidRpcRouterRef ref) async {
  final loadedProjects = await ref.watch(projectsProvider.future);

  final routes = loadedProjects
      .map(
        (lp) => StatefulShellBranch(
          initialLocation: '/project/${lp.project.id}',
          routes: [
            GoRoute(
              path: '/project/${lp.project.id}',
              builder: (context, state) => ProjectPage(
                projectId: lp.project.id,
              ),
            ),
          ],
        ),
      )
      .toList();

  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: loadedProjects.isNotEmpty
        ? '/project/${loadedProjects.first.project.id}'
        : '/',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => ProjectNavigationShell(
          navigationShell: navigationShell,
        ),
        branches: [
          ...routes,
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/',
                builder: (context, state) => const NoProjectPage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
