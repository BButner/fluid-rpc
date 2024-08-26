import 'package:collection/collection.dart';
import 'package:frpc_gui/features/projects/widgets/tab_method_body.dart';
import 'package:frpc_gui/src/rust/api/models/descriptors/method_descriptor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tabbed_view/tabbed_view.dart';

part 'project_tab_controller_provider.g.dart';

/// The state for the project tabs.
class ProjectTabState {
  /// Creates a new [ProjectTabState].
  ProjectTabState({
    required this.projectId,
    required this.tabController,
  });

  /// The id this project belongs to.
  final String projectId;

  /// The [TabbedViewController] for this state.
  final TabbedViewController tabController;

  /// Copy with.
  ProjectTabState copyWith() => ProjectTabState(
        projectId: projectId,
        tabController: tabController,
      );
}

/// Provider used to supply the state for project tab functionality.
@riverpod
class ProjectTabController extends _$ProjectTabController {
  @override
  ProjectTabState build(String projectId) => ProjectTabState(
        projectId: projectId,
        tabController: TabbedViewController([]),
      );

  /// Attempt to open a new tab for a method, or activate it if its already open.
  void openOrActivateTab(
    MethodDescriptor method,
  ) {
    final existingTab = _getTabFromMethod(method);

    if (existingTab != null) {
      state.tabController.selectedIndex = existingTab.index;
      return;
    }

    final tabData = TabData(
      keepAlive: true,
      value: method.fullName,
      text: method.name,
      content: TabMethodBody(
        projectId: state.projectId,
        method: method,
      ),
    );

    state.tabController.addTab(tabData);

    state.tabController.selectedIndex = tabData.index;
  }

  TabData? _getTabFromMethod(MethodDescriptor method) =>
      state.tabController.tabs
          .firstWhereOrNull((t) => t.value == method.fullName);
}
