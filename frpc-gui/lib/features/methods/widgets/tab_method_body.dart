import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frpc_gui/core/theme/fluid_colors.dart';
import 'package:frpc_gui/features/methods/method_state_provider.dart';
import 'package:frpc_gui/features/projects/widgets/horizontal_resize_area.dart';
import 'package:frpc_gui/features/methods/widgets/method_avatar.dart';
import 'package:frpc_gui/features/methods/widgets/method_builder.dart';
import 'package:frpc_gui/features/methods/widgets/method_response_area.dart';
import 'package:frpc_gui/src/rust/api/models/descriptors/method_descriptor.dart';

/// The body of the selected method in a tab.
class TabMethodBody extends ConsumerWidget {
  /// Creates a new [TabMethodBody].
  const TabMethodBody({
    required this.projectId,
    required this.method,
    super.key,
  });

  /// The project id this belongs to.
  final String projectId;

  /// The [MethodDescriptor] to be displayed.
  final MethodDescriptor method;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final methodState = ref.watch(methodStateProvider.call(method.target()));

    return Card(
      margin: const EdgeInsets.only(top: 8.8),
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: FluidColors.zinc.shade800,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  MethodAvatar(isStreaming: method.isServerStreaming),
                  const SizedBox(width: 12.0),
                  Text(
                    method.parentServiceName,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: FluidColors.zinc.shade400,
                        ),
                  ),
                  Text(
                    '/',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: FluidColors.zinc.shade400,
                        ),
                  ),
                  Expanded(
                    child: Text(
                      method.name,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  if (methodState.startTime != null &&
                      methodState.lastUpdateTime != null)
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Text(
                        'Duration: ${methodState.lastUpdateTime!.difference(methodState.startTime!).toString()}ms',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: FluidColors.zinc.shade400,
                            ),
                      ),
                    ),
                  ElevatedButton.icon(
                    onPressed: methodState.cancellation != null
                        ? null
                        : () async {
                            final state = ref.read(
                                methodStateProvider.call(method.target()));

                            final responseStream = await ref
                                .read(
                                  methodStateProvider
                                      .call(method.target())
                                      .notifier,
                                )
                                .invoke(projectId);
                          },
                    icon: const Icon(
                      Icons.play_arrow_rounded,
                    ),
                    label: const Text('Execute'),
                  ),
                  const SizedBox(width: 8.0),
                  FilledButton.icon(
                    onPressed: methodState.cancellation == null
                        ? null
                        : () {
                            ref
                                .read(
                                  methodStateProvider
                                      .call(method.target())
                                      .notifier,
                                )
                                .cancel();
                          },
                    icon: const Icon(
                      Icons.close_rounded,
                    ),
                    label: const Text('Cancel'),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) => HorizontalResizeArea(
                constraints: constraints,
                leftChild: MethodBuilder(
                  projectId: projectId,
                  method: method,
                ),
                rightChild: MethodResponseArea(
                  projectId: projectId,
                  method: method,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
