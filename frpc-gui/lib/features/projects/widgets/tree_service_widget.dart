import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frpc_gui/features/projects/project_state_provider.dart';
import 'package:frpc_gui/src/rust/api/models/descriptors/server_descriptor.dart';
import 'package:frpc_gui/src/rust/api/models/descriptors/service_descriptor.dart';

class TreeServiceWidget extends ConsumerWidget {
  const TreeServiceWidget({
    required this.projectId,
    required this.service,
    required this.server,
    super.key,
  });

  final String projectId;

  final ServiceDescriptor service;

  final ServerDescriptor server;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ExpansionTile(
      title: Text(service.name),
      children: service.methods
          .map(
            (m) => TextButton(
              onPressed: () {
                ref
                    .read(projectStateProvider.call(projectId).notifier)
                    .openMethod(service, m, server);
              },
              child: Text(m.name),
            ),
          )
          .toList(),
    );
  }
}
