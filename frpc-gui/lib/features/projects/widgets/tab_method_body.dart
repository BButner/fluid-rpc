import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frpc_gui/core/theme/fluid_colors.dart';
import 'package:frpc_gui/features/projects/method_state_provider.dart';
import 'package:frpc_gui/features/projects/widgets/horizontal_resize_area.dart';
import 'package:frpc_gui/features/projects/widgets/method_avatar.dart';
import 'package:frpc_gui/features/projects/widgets/method_builder.dart';
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
  Widget build(BuildContext context, WidgetRef ref) => Card(
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
                    ElevatedButton.icon(
                      onPressed: () {
                        final state =
                            ref.read(methodStateProvider.call(method.fullName));

                        print(state.requestData);
                      },
                      icon: const Icon(
                        Icons.play_arrow_rounded,
                      ),
                      label: const Text('Execute'),
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
                  rightChild: const Text('method response area'),
                ),
              ),
            ),
          ],
        ),
      );
}
