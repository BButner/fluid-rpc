import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frpc_gui/features/projects/project_state_provider.dart';
import 'package:frpc_gui/features/projects/widgets/tree_service_widget.dart';
import 'package:frpc_gui/src/rust/api/models/descriptors/server_descriptor.dart';
import 'package:frpc_gui/src/rust/api/simple.dart';

class RpcTree extends ConsumerStatefulWidget {
  const RpcTree({
    required this.projectId,
    super.key,
  });

  final String projectId;

  @override
  ConsumerState<RpcTree> createState() => _RpcTreeState();
}

class _RpcTreeState extends ConsumerState<RpcTree> {
  Future<ServerDescriptor?> _getServerDescriptor() async {
    final projectState =
        await ref.read(projectStateProvider.call(widget.projectId).future);

    if (projectState.selectedEnvironment == null) return null;

    final connection = projectState.selectedEnvironment!.connection;

    final desc = await testGetServerDescriptor(
        serverUrl: 'http://${connection.host}:${connection.port}');

    return desc;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getServerDescriptor(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }

        if (snapshot.hasData) {
          final desc = snapshot.data!;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14.0,
                  vertical: 8.0,
                ),
                child: Text(
                  'RPC Tree',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    for (final service in desc.services.sortedBy((s) => s.name))
                      TreeServiceWidget(
                        projectId: widget.projectId,
                        service: service,
                        server: desc,
                      ),
                  ],
                ),
              ),
            ],
          );
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
