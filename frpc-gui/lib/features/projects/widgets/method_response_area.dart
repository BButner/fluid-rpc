import 'package:flutter/material.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:flutter_highlight/themes/vs2015.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frpc_gui/features/projects/method_state_provider.dart';
import 'package:frpc_gui/src/rust/api/models/descriptors/method_descriptor.dart';
import 'package:highlight/languages/json.dart' as highlight;

/// Widget that contains all of the functionality related to the method response.
class MethodResponseArea extends ConsumerStatefulWidget {
  /// Creates a new [MethodResponseArea].
  const MethodResponseArea({
    required this.projectId,
    required this.method,
    super.key,
  });

  /// The id of the project this belongs to.
  final String projectId;

  /// The [MethodDescriptor] to display the invocation responses of.
  final MethodDescriptor method;

  @override
  ConsumerState<MethodResponseArea> createState() => _MethodResponseAreaState();
}

class _MethodResponseAreaState extends ConsumerState<MethodResponseArea> {
  final _responseController = CodeController(
    language: highlight.json,
  );

  @override
  Widget build(BuildContext context) {
    final methodState =
        ref.watch(methodStateProvider.call(widget.method.target()));

    ref.listen(methodStateProvider.call(widget.method.target()), (prev, next) {
      if (next.responseData != prev?.responseData ||
          _responseController.text != next.responseData) {
        _responseController.text = next.responseData;
      }
    });

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
                    controller: _responseController,
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
