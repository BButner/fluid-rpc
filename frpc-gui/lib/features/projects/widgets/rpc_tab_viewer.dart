import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frpc_gui/features/projects/project_state_provider.dart';
import 'package:frpc_gui/features/projects/widgets/rpc_tab_body.dart';

class RpcTabViewer extends ConsumerWidget {
  const RpcTabViewer({
    required this.projectId,
    super.key,
  });

  final String projectId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectStateAsync = ref.watch(projectStateProvider.call(projectId));

    return projectStateAsync.when(
      data: (projectState) => AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: projectState.openedMethods.isEmpty
            ? const Align(child: Text('Open a Method'))
            : DefaultTabController(
                length: projectState.openedMethods.length,
                child: Column(
                  children: [
                    TabBar(
                      isScrollable: true,
                      labelPadding:
                          const EdgeInsets.symmetric(horizontal: 12.0),
                      tabAlignment: TabAlignment.start,
                      tabs: projectState.openedMethods
                          .map((m) => Tab(
                                text: m.method.name,
                              ))
                          .toList(),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: projectState.openedMethods
                            .map(
                              (m) => RpcTabBody(
                                projectId: projectId,
                                method: m,
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
      ),
      error: (error, stackTrace) => Text(
        error.toString(),
      ),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
