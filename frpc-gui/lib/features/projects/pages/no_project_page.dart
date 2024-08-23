import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Page to be displayed when there are no projects.
class NoProjectPage extends ConsumerWidget {
  /// Creates a new [NoProjectPage].
  const NoProjectPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) => const Column(
      children: [
        Text(
          'No Projects...',
        ),
      ],
    );
}
