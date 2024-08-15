import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frpc_gui/features/projects/project_state_provider.dart';
import 'package:frpc_gui/src/rust/api/models/stream_event.dart';
import 'package:frpc_gui/src/rust/api/simple.dart';

class RpcTabBody extends ConsumerStatefulWidget {
  const RpcTabBody({
    required this.method,
    required this.projectId,
    super.key,
  });

  final OpenedMethod method;

  final String projectId;

  @override
  ConsumerState<RpcTabBody> createState() => _RpcTabBodyState();
}

class _RpcTabBodyState extends ConsumerState<RpcTabBody> {
  List<FluidFrontendStreamEvent> _events = [];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    widget.method.method.name,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () async {
                  setState(() {
                    _events = [];
                  });

                  final projectState = await ref
                      .read(projectStateProvider.call(widget.projectId).future);
                  final con = projectState.selectedEnvironment!.connection;

                  await for (final res in testInvokeWithPool(
                    desc: widget.method.server,
                    serverUrl: 'http://${con.host}:${con.port}',
                    target:
                        '${widget.method.parentService.fullName}/${widget.method.method.name}',
                  )) {
                     
                    setState(() {
                      _events.add(res);
                    });
                  }
                },
                child: const Text('Invoke'),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              for (final res in _events) Text(res.toString()),
            ],
          ),
        ),
      ],
    );
  }
}
