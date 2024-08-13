import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frpc_gui/features/app_config/app_config_provider.dart';
import 'package:frpc_gui/src/rust/api/models/config/app_config.dart';
import 'package:frpc_gui/src/rust/api/models/project/project.dart';
import 'package:path/path.dart';
import 'package:uuid/uuid.dart';

class CreateProjectPopup extends ConsumerStatefulWidget {
  const CreateProjectPopup({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateCollectionPopupState();
}

class _CreateCollectionPopupState extends ConsumerState<CreateProjectPopup> {
  final _displayNameController = TextEditingController();
  final _projectDirController = TextEditingController();
  ProjectLoader _loaderType = ProjectLoader.serverReflection();

  String _displayName = '';
  String _projectDirPath = '';

  void _displayNameChanged() {
    setState(() {
      _displayName = _displayNameController.text;
    });
  }

  void _projectDirChanged() {
    setState(() {
      _projectDirPath = _projectDirController.text;
    });
  }

  @override
  void initState() {
    super.initState();

    _displayNameController.addListener(_displayNameChanged);
    _projectDirController.addListener(_projectDirChanged);
  }

  @override
  void dispose() {
    _displayNameController.dispose();
    _projectDirController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 48.0,
                child: Text(
                  Project.getDefaultAvatar(
                      displayName: _displayNameController.text.isNotEmpty
                          ? _displayNameController.text
                          : '?'),
                ),
              ),
              Expanded(
                child: TextField(
                  controller: _displayNameController,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _projectDirController,
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  String? selectedDirectory =
                      await FilePicker.platform.getDirectoryPath();

                  if (selectedDirectory == null) {
                    return;
                  }

                  _projectDirController.text = selectedDirectory;
                },
                child: const Text('Browse'),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () async {
              final appConfig = ref.read(applicationConfigProvider.notifier);

              var project = Project(
                id: const Uuid().v4(),
                displayName: _displayName,
                environments: [],
                loaderType: const ProjectLoader.serverReflection(),
              );

              final path = join(_projectDirPath, '${_displayName}.frpc');
              print(path);
              await project.save(projectDirectoryPath: _projectDirPath);
              print('saved');
              await appConfig.addToCache(project.id, path);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
