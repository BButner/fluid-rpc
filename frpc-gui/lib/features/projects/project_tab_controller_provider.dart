import 'package:collection/collection.dart';
import 'package:frpc_gui/features/projects/widgets/tab_method_body.dart';
import 'package:frpc_gui/src/rust/api/models/descriptors/method_descriptor.dart';
import 'package:frpc_gui/src/rust/api/models/descriptors/service_descriptor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tabbed_view/tabbed_view.dart';

part 'project_tab_controller_provider.g.dart';

class ProjectTabState {
  ProjectTabState({
    required this.projectId,
    required this.tabController,
  });

  final String projectId;

  final TabbedViewController tabController;

  ProjectTabState copyWith() => ProjectTabState(
        projectId: projectId,
        tabController: tabController,
      );
}

@riverpod
class ProjectTabController extends _$ProjectTabController {
  @override
  ProjectTabState build(String projectId) => ProjectTabState(
        projectId: projectId,
        tabController: TabbedViewController([]),
      );

  void openOrActivateTab(
    MethodDescriptor method,
  ) {
    final existingTab = _getTabFromMethod(method);

    if (existingTab != null) {
      state.tabController.selectedIndex = existingTab.index;
      return;
    }

    final tabData = TabData(
      value: method.fullName,
      text: method.name,
      content: TabMethodBody(method: method),
    );

    state.tabController.addTab(tabData);

    state.tabController.selectedIndex = tabData.index;
  }

  TabData? _getTabFromMethod(MethodDescriptor method) =>
      state.tabController.tabs
          .firstWhereOrNull((t) => t.value == method.fullName);
}
