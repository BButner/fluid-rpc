import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frpc_gui/core/theme/fluid_theme.dart';
import 'package:frpc_gui/features/router/router.dart';
import 'package:frpc_gui/src/rust/frb_generated.dart';

Future<void> main() async {
  await RustLib.init();
  runApp(
    const ProviderScope(
      child: FrpcApp(),
    ),
  );
}

class FrpcApp extends ConsumerWidget {
  const FrpcApp({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routerAsync = ref.watch(fluidRpcRouterProvider);

    return routerAsync.when(
      data: (router) => MaterialApp.router(
        routerConfig: router,
        title: 'Fluid RPC',
        theme: FluidTheme.fluidTheme,
      ),
      error: (error, stackTrace) => Directionality(
        textDirection: TextDirection.ltr,
        child: Text(
          error.toString(),
        ),
      ),
      loading: () => const Directionality(
        textDirection: TextDirection.ltr,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
