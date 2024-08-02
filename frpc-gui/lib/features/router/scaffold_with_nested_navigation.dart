import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Stateful navigation.
class ScaffoldWithNestedNavigation extends ConsumerWidget {
  /// Creates a new [ScaffoldWithNestedNavigation].
  const ScaffoldWithNestedNavigation({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));

  /// The [StatefulNavigationShell] to use.
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
          child: Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: navigationShell,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
