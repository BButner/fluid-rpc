import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:flutter_highlight/themes/vs2015.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frpc_gui/core/theme/fluid_colors.dart';
import 'package:frpc_gui/features/methods/method_state_provider.dart';
import 'package:frpc_gui/src/rust/api/models/descriptors/method_descriptor.dart';
import 'package:frpc_gui/src/rust/api/models/stream_event.dart';
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
  List<FluidFrontendStreamEvent> _responses = [];

  @override
  Widget build(BuildContext context) {
    final methodState =
        ref.watch(methodStateProvider.call(widget.method.target()));

    ref.listen(methodStateProvider.call(widget.method.target()), (prev, next) {
      if (next.responses.isEmpty) {
        setState(() {
          _responses = [];
        });
      } else {
        final notIncluded =
            next.responses.where((r) => !_responses.contains(r)).toList();

        setState(() {
          _responses = [
            ..._responses,
            ...notIncluded,
          ];
        });

        final lastError = notIncluded
            .lastWhereOrNull((r) => r is FluidFrontendStreamEvent_Error);

        if (lastError is FluidFrontendStreamEvent_Error) {
          final msg = ScaffoldMessenger.of(context);

          msg.showSnackBar(
            SnackBar(
              backgroundColor: FluidColors.red.shade800,
              margin: const EdgeInsets.all(12.0),
              behavior: SnackBarBehavior.floating,
              content: Text(
                lastError.field0.error,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: FluidColors.red.shade100,
                    ),
              ),
            ),
          );
        }

        final lastMessage = _responses.lastWhereOrNull(
          (r) =>
              r is FluidFrontendStreamEvent_UnaryMessageReceived ||
              r is FluidFrontendStreamEvent_StreamingMessageReceived,
        );

        switch (lastMessage) {
          case FluidFrontendStreamEvent_StreamingMessageReceived():
            _responseController.text = lastMessage.message.contents;
          case FluidFrontendStreamEvent_UnaryMessageReceived():
            _responseController.text = lastMessage.message.contents;
          default:
            break;
        }
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
