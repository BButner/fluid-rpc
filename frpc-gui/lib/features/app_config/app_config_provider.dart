import 'package:frpc_gui/src/rust/api/models/config/app_config.dart';
import 'package:frpc_gui/src/rust/api/models/project/project.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_config_provider.g.dart';

/// Provider for the application config.
@riverpod
class ApplicationConfig extends _$ApplicationConfig {
  @override
  Future<AppConfig> build() async {
    final appDir = await _getAppDirPath();

    final config = await AppConfig.load(appSettingsDirectory: appDir);

    return config;
  }

  /// Adds a new project by id and path, to the cache. This gets displayed in the Project selection menu.
  Future<void> addToCache(String id, String dirPath) async {
    final val = state.value!;
    val.cachedProjectPaths.putIfAbsent(id, () => dirPath);

    state = AsyncValue.data(val);

    await val.save(appSettingsDirectory: await _getAppDirPath());
  }

  /// Adds a new project by its path to the cache.
  Future<void> addToCacheFromFile(String filePath) async {
    final val = state.value!;

    final project = await Project.loadProject(configFilePath: filePath);

    if (project != null) {
      await addToCache(project.project.id, filePath);
    }
  }

  Future<String> _getAppDirPath() async =>
      join((await getLibraryDirectory()).path, 'Fluid RPC');
}
