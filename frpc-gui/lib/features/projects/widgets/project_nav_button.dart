import 'package:flutter/material.dart';
import 'package:frpc_gui/src/rust/api/models/project/project.dart';

class ProjectNavButton extends StatelessWidget {
  const ProjectNavButton({
    required this.project,
    required this.index,
    required this.goBranch,
    super.key,
  });

  final Project project;

  final int index;

  final Function(int branch) goBranch;

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: () {
          goBranch(index);
        },
        child: Text(
          Project.getDefaultAvatar(
            displayName: project.displayName,
          ),
        ),
      );
}
