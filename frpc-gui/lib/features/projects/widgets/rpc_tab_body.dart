import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frpc_gui/features/projects/project_state_provider.dart';
import 'package:frpc_gui/src/rust/api/models/descriptors/server_descriptor.dart';
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
  bool _isInvoking = false;
  CancelableOperation? _invocation;
  CancelableExecution? _execution;

  Future<void> _beginInvocation() async {
    setState(() {
      _events = [];
      _isInvoking = true;
    });

    _execution = await CancelableExecution.newInstance();

    await _invocation?.cancel();

    final projectState =
        await ref.read(projectStateProvider.call(widget.projectId).future);
    final con = projectState.selectedEnvironment!.connection;

    _invocation = CancelableOperation.fromFuture(_listenResponseStream(
      widget.method.server,
      'http://${con.host}:${con.port}',
      '${widget.method.parentService.fullName}/${widget.method.method.name}',
      _execution!,
    ));

    await _invocation?.value;

    setState(() {
      _isInvoking = false;
      _invocation = null;
    });
  }

  Future<void> _listenResponseStream(
    ServerDescriptor desc,
    String serverUrl,
    String target,
    CancelableExecution exec,
  ) async {
    await for (final res in testInvokeWithPool(
      desc: desc,
      serverUrl: serverUrl,
      target: target,
      cancelExec: exec,
    )) {
      setState(() {
        _events.add(res);
      });
    }
  }

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
              Row(
                children: [
                  ElevatedButton(
                    onPressed: _isInvoking
                        ? null
                        : () async => await _beginInvocation(),
                    child: const Text('Invoke'),
                  ),
                  ElevatedButton(
                    onPressed: !_isInvoking
                        ? null
                        : () async {
                            _execution?.cancel();
                            await _invocation?.cancel();
                            setState(() {
                              _isInvoking = false;
                            });
                          },
                    child: const Text('Cancel'),
                  ),
                ],
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
