import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectPage extends ConsumerWidget {
  final String projectId;

  ProjectPage({
    required this.projectId,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text('testing');
  }
}
