import 'package:auto_route/auto_route.dart';
import 'package:frpc_gui/features/router/router.gr.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@AutoRouterConfig()
class FluidRpcRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: ProjectsRoute.page, initial: true, children: [
          AutoRoute(
            page: NoProjectRoute.page,
            initial: true,
          ),
        ]),
      ];
}

/// The [FluidRpcRouter] for the application.
@riverpod
FluidRpcRouter fluidRpcRouter(FluidRpcRouterRef ref) => FluidRpcRouter();
