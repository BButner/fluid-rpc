import 'package:flutter/material.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:flutter_highlight/themes/vs2015.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frpc_gui/features/projects/method_state_provider.dart';
import 'package:frpc_gui/src/rust/api/models/descriptors/method_descriptor.dart';
import 'package:highlight/languages/json.dart' as highlight;

/// Widget used as the encompassing widget to build a gRPC Method request for invocation.
class MethodBuilder extends ConsumerStatefulWidget {
  /// Creates a new [MethodBuilder].
  const MethodBuilder({
    required this.projectId,
    required this.method,
    super.key,
  });

  /// The project id this belongs to.
  final String projectId;

  /// The [MethodDescriptor] we're building the request for.
  final MethodDescriptor method;

  @override
  ConsumerState<MethodBuilder> createState() => _MethodBuilderState();
}

class _MethodBuilderState extends ConsumerState<MethodBuilder> {
  late final CodeController _dataController;

  @override
  void initState() {
    super.initState();

    _dataController = CodeController(
      text: widget.method.defaultData,
      language: highlight.json,
    );

    _dataController.addListener(
      () => ref
          .read(methodStateProvider.call(widget.method.fullName).notifier)
          .updateRequestData(_dataController.text),
    );

    _dataController.text = widget.method.defaultData;
  }

  @override
  void dispose() {
    _dataController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _ = ref.watch(methodStateProvider.call(widget.method.target()));

    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Theme(
              data: Theme.of(context).copyWith(
                inputDecorationTheme: const InputDecorationTheme(),
              ),
              child: CodeTheme(
                data: CodeThemeData(
                  styles: vs2015Theme,
                ),
                child: SingleChildScrollView(
                  child: CodeField(
                    controller: _dataController,
                    textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontFamily: 'JetBrainsMono',
                        ),
                    background: Colors.transparent,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
