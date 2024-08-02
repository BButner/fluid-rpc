import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    final router = ref.watch(goRouterProvider);

    return MaterialApp.router(
      routerConfig: router,
      title: 'Fluid RPC',
    );
  }
}
