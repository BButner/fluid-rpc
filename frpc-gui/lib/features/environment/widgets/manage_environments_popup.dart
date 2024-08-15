import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frpc_gui/features/projects/project_state_provider.dart';
import 'package:frpc_gui/src/rust/api/models/connection/connection_config.dart';
import 'package:frpc_gui/src/rust/api/models/connection/tls_type.dart';
import 'package:frpc_gui/src/rust/api/models/environment/environment.dart';
import 'package:uuid/uuid.dart';

class ManageEnvironmentsPopup extends ConsumerStatefulWidget {
  const ManageEnvironmentsPopup({
    required this.projectId,
    super.key,
  });

  final String projectId;

  @override
  ConsumerState<ManageEnvironmentsPopup> createState() =>
      _ManageEnvironmentsPopupState();
}

class _ManageEnvironmentsPopupState
    extends ConsumerState<ManageEnvironmentsPopup> {
  String _displayName = '';
  String _hostname = '';

  final _displayNameController = TextEditingController();
  final _hostnameController = TextEditingController();
  ConnectionConfig? connectionConfig;

  @override
  void initState() {
    super.initState();

    _displayNameController.addListener(() => setState(() {
          _displayName = _displayNameController.text;
        }));
    _hostnameController.addListener(() => setState(() {
          _hostname = _hostnameController.text;
        }));
  }

  @override
  void dispose() {
    _displayNameController.dispose();
    _hostnameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final stateNotifier =
        ref.watch(projectStateProvider.call(widget.projectId).notifier);
    final navigator = Navigator.of(context);

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        children: [
          TextField(
            controller: _displayNameController,
          ),
          TextField(
            controller: _hostnameController,
          ),
          ElevatedButton(
            onPressed: () async {
              final hostParts = _hostname.split(':');

              final environment = Environment(
                id: const Uuid().v4(),
                displayName: _displayName,
                connection: ConnectionConfig(
                  host: hostParts[0],
                  port: int.parse(hostParts[1]),
                  tlsType: const TlsType.plainText(),
                ),
              );

              await stateNotifier.addEnvironment(environment);
              stateNotifier.selectEnvironment(environment.id);
              navigator.pop();
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
