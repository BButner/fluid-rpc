import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frpc_gui/core/theme/fluid_colors.dart';
import 'package:frpc_gui/features/projects/project_tab_controller_provider.dart';
import 'package:tabbed_view/tabbed_view.dart';

/// Page that displays the data related to a project.
class ProjectPage extends ConsumerStatefulWidget {
  /// Creates a new [ProjectPage].
  const ProjectPage({
    required this.projectId,
    super.key,
  });

  /// The id of the project that this page is displaying.
  final String projectId;

  @override
  ConsumerState<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends ConsumerState<ProjectPage> {
  @override
  Widget build(BuildContext context) {
    final projectTabController =
        ref.watch(projectTabControllerProvider.call(widget.projectId));

    return Column(
      children: [
        Expanded(
          child: TabbedViewTheme(
            data: TabbedViewThemeData(
              tabsArea: TabsAreaThemeData(
                color: FluidColors.zinc[950],
                normalButtonColor: FluidColors.zinc.shade500,
                hoverButtonColor: FluidColors.zinc.shade200,
                middleGap: 8.0,
                dropColor: FluidColors.violet.shade700,
              ),
              menu: TabbedViewMenuThemeData(
                color: FluidColors.zinc.shade900,
                border: Border.all(
                  color: FluidColors.zinc.shade800,
                ),
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.fromLTRB(
                  8.0,
                  16.0,
                  8.0,
                  8.0,
                ),
              ),
              tab: TabThemeData(
                buttonsOffset: 10.0,
                normalButtonColor: FluidColors.zinc.shade400,
                disabledButtonColor: FluidColors.zinc.shade700,
                hoverButtonColor: FluidColors.zinc.shade200,
                padding: const EdgeInsets.fromLTRB(
                  12.0,
                  8.0,
                  12.0,
                  8.0,
                ),
                selectedStatus: TabStatusThemeData(
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardTheme.color,
                    border: Border.all(
                      color: FluidColors.zinc.shade800,
                    ),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
                highlightedStatus: TabStatusThemeData(
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardTheme.color,
                    border: Border.all(
                      color: FluidColors.zinc.shade900,
                    ),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  normalButtonColor: FluidColors.zinc.shade400,
                  hoverButtonColor: FluidColors.zinc.shade200,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  border: Border.all(
                    color: FluidColors.zinc[950]!,
                  ),
                ),
              ),
            ),
            child: TabbedView(
              controller: projectTabController.tabController,
              onDraggableBuild: (controller, index, data) => DraggableConfig(
                feedback: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(border: Border.all()),
                  child: Text(data.text),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
