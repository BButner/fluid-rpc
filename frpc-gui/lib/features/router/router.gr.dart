// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:frpc_gui/features/projects/pages/no_project_page.dart' as _i1;
import 'package:frpc_gui/features/router/projects_page.dart' as _i2;

/// generated route for
/// [_i1.NoProjectPage]
class NoProjectRoute extends _i3.PageRouteInfo<void> {
  const NoProjectRoute({List<_i3.PageRouteInfo>? children})
      : super(
          NoProjectRoute.name,
          initialChildren: children,
        );

  static const String name = 'NoProjectRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return _i1.NoProjectPage();
    },
  );
}

/// generated route for
/// [_i2.ProjectsPage]
class ProjectsRoute extends _i3.PageRouteInfo<void> {
  const ProjectsRoute({List<_i3.PageRouteInfo>? children})
      : super(
          ProjectsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProjectsRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i2.ProjectsPage();
    },
  );
}
