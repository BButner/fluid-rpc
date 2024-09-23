import 'package:flutter/material.dart';
import 'package:frpc_gui/core/extensions/text_style_extensions.dart';
import 'package:frpc_gui/core/theme/fluid_colors.dart';
import 'package:frpc_gui/src/rust/api/models/project/project.dart';
import 'package:go_router/go_router.dart';
import 'package:tabbed_view/tabbed_view.dart';

/// Page used to create a new project.
class CreateProjectPage extends StatefulWidget {
  /// Creates a new [CreateProjectPage].
  const CreateProjectPage({
    super.key,
  });

  @override
  State<CreateProjectPage> createState() => _CreateProjectPageState();
}

enum _SelectedLoaderType {
  reflection,
  protoImport;
}

class _CreateProjectPageState extends State<CreateProjectPage> {
  final _displayNameController = TextEditingController();
  String _displayName = '';

  final _projDirController = TextEditingController();
  String _projDir = '';

  _SelectedLoaderType _loaderType = _SelectedLoaderType.reflection;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'New Project',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ),
                  FilledButton(
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                    child: const Text('Back'),
                  ),
                  const SizedBox(width: 8.0),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Save'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Card(
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
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  .semibold
                                  .tertiary(
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
                                    surfaceTintColor:
                                        FluidColors.violet.shade600,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: FluidColors.violet.shade600,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Text(
                                          Project.getDefaultAvatar(
                                            displayName:
                                                _displayName.trim().isEmpty
                                                    ? '?'
                                                    : _displayName,
                                          ),
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayLarge!
                                              .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color:
                                                    FluidColors.violet.shade300,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16.0),
                                Expanded(
                                  child: TextField(
                                    controller: _displayNameController,
                                    decoration: const InputDecoration(
                                      hintText: 'Project Display Name',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16.0),
                            Text(
                              'Project Directory',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  .semibold
                                  .tertiary(
                                    context,
                                  ),
                            ),
                            const SizedBox(height: 8.0),
                            Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: _projDirController,
                                    decoration: const InputDecoration(
                                      hintText: 'Project Directory',
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8.0),
                                FilledButton(
                                  onPressed: () {},
                                  child: const Text('Browse'),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16.0),
                            Text(
                              'Proto Loader Type',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  .semibold
                                  .tertiary(
                                    context,
                                  ),
                            ),
                            const SizedBox(height: 8.0),
                            RadioListTile(
                              title: const Text('Server Reflection'),
                              value: _SelectedLoaderType.reflection,
                              groupValue: _loaderType,
                              onChanged: (val) {
                                if (val == null) {
                                  return;
                                }

                                setState(() {
                                  _loaderType = val;
                                });
                              },
                            ),
                            RadioListTile(
                              title: const Text('Proto File Import'),
                              value: _SelectedLoaderType.protoImport,
                              groupValue: _loaderType,
                              onChanged: (val) {
                                if (val == null) {
                                  return;
                                }

                                setState(() {
                                  _loaderType = val;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Card(
                            margin: const EdgeInsets.all(8.0),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Environments',
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
