import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frpc_gui/features/collections/collections_provider.dart';

class CollectionsPage extends ConsumerWidget {
  const CollectionsPage({
    required this.child,
    super.key,
  });

  final Widget? child;

  static const double sidebarWidth = 64.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final collections = ref.watch(collectionsProvider);

    return Scaffold(
      body: Row(
        children: [
          ColoredBox(
            color: Theme.of(context).colorScheme.tertiaryContainer,
            child: SizedBox(
              width: sidebarWidth,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.ac_unit,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
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
            child: child ??
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'No Collections',
                    )
                  ],
                ),
          ),
        ],
      ),
    );
  }
}
