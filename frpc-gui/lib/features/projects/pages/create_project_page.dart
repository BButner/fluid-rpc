import 'package:flutter/material.dart';
import 'package:frpc_gui/features/projects/widgets/new/new_project_general.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';

/// Page used to create a new project.
class CreateProjectPage extends StatefulWidget {
  /// Creates a new [CreateProjectPage].
  const CreateProjectPage({
    super.key,
  });

  @override
  State<CreateProjectPage> createState() => _CreateProjectPageState();
}

class _CreateProjectPageState extends State<CreateProjectPage> {
  final _generalFormKey = GlobalKey<FormState>();
  final _newId = Uuid().v4();

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
                    child: Form(
                      key: _generalFormKey,
                      child: NewProjectGeneral(
                        id: _newId,
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
