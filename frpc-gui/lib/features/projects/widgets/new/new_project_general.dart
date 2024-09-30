import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frpc_gui/core/extensions/text_style_extensions.dart';
import 'package:frpc_gui/core/theme/fluid_colors.dart';
import 'package:frpc_gui/features/projects/new_project_provider.dart';
import 'package:frpc_gui/src/rust/api/models/project/project.dart';
import 'package:frpc_gui/src/rust/api/models/project/project_utilities.dart';

/// Widget to handle the general information section of a new project.
class NewProjectGeneral extends ConsumerStatefulWidget {
  /// Creates a new [NewProjectGeneral].
  const NewProjectGeneral({
    required this.id,
    super.key,
  });

  /// The id of the new project.
  final String id;

  @override
  ConsumerState<NewProjectGeneral> createState() => _NewProjectGeneralState();
}

class _NewProjectGeneralState extends ConsumerState<NewProjectGeneral> {
  final _displayNameController = TextEditingController();
  final _projDirController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _displayNameController.addListener(() {
      ref
          .read(newProjectProvider.call(widget.id).notifier)
          .updateDisplayName(_displayNameController.text);
    });

    _projDirController.addListener(() {
      ref
          .read(newProjectProvider.call(widget.id).notifier)
          .updateProjectDirectory(_projDirController.text);
    });
  }

  @override
  void dispose() {
    _displayNameController.dispose();
    _projDirController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final projState = ref.watch(newProjectProvider.call(widget.id));

    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'General',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 24.0),
            Text(
              'Display Name',
              style: Theme.of(context).textTheme.bodyMedium.semibold.tertiary(
                    context,
                  ),
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                SizedBox(
                  width: 64.0,
                  height: 64.0,
                  child: Card(
                    color: FluidColors.zinc[1000],
                    surfaceTintColor: FluidColors.violet.shade600,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: FluidColors.violet.shade600,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: Center(
                      child: Text(
                        Project.getDefaultAvatar(
                          displayName:
                              _displayNameController.text.trim().isEmpty
                                  ? 'X'
                                  : _displayNameController.text,
                        ),
                        style:
                            Theme.of(context).textTheme.displayLarge!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: FluidColors.violet.shade300,
                                ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: TextFormField(
                    controller: _displayNameController,
                    decoration: const InputDecoration(
                      hintText: 'Project Display Name',
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Display Name required.';
                      }

                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Text(
              'Project Directory',
              style: Theme.of(context).textTheme.bodyMedium.semibold.tertiary(
                    context,
                  ),
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _projDirController,
                    decoration: const InputDecoration(
                      hintText: 'Project Directory',
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Project Directory required.';
                      }

                      return ProjectUtilities.validateProjectDir(
                        dirPath: value,
                      );
                    },
                  ),
                ),
                const SizedBox(width: 8.0),
                FilledButton(
                  onPressed: () async {
                    final result = await FilePicker.platform.getDirectoryPath(
                      dialogTitle: 'Select Fluid RPC Project Directory',
                      lockParentWindow: true,
                    );

                    if (result != null && result.isNotEmpty) {
                      _projDirController.text = result;
                    }
                  },
                  child: const Text('Browse'),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Text(
              'Proto Loader Type',
              style: Theme.of(context).textTheme.bodyMedium.semibold.tertiary(
                    context,
                  ),
            ),
            const SizedBox(height: 8.0),
            RadioListTile(
              title: const Text('Server Reflection'),
              value: SelectedLoaderType.reflection,
              groupValue: projState.loaderType,
              onChanged: (val) {
                if (val == null) {
                  return;
                }

                ref
                    .read(newProjectProvider.call(widget.id).notifier)
                    .updateLoaderType(val);
              },
            ),
            RadioListTile(
              title: const Text('Proto File Import'),
              value: SelectedLoaderType.protoImport,
              groupValue: projState.loaderType,
              onChanged: (val) {
                if (val == null) {
                  return;
                }

                ref
                    .read(newProjectProvider.call(widget.id).notifier)
                    .updateLoaderType(val);
              },
            ),
          ],
        ),
      ),
    );
  }
}
