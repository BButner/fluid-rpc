import 'package:frpc_gui/features/app_config/app_config_provider.dart';
import 'package:frpc_gui/src/rust/api/models/project/project.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'projects_provider.g.dart';

@riverpod
class Projects extends _$Projects {
  @override
  Future<List<LoadedProject>> build() async {
    final appConfig = await ref.watch(applicationConfigProvider.future);

    final List<LoadedProject> loadedProjects = [];

    for (final kv in appConfig.cachedProjectPaths.entries) {
      final project = await Project.loadProject(configFilePath: kv.value);

      if (project != null) {
        loadedProjects.add(project);
      }
    }

    return loadedProjects;
  }
}
