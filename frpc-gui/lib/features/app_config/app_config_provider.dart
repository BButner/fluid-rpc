
import 'package:frpc_gui/src/rust/api/models/config/app_config.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_config_provider.g.dart';

@riverpod
class ApplicationConfig extends _$ApplicationConfig {
  @override
  Future<AppConfig> build() async {
    final appDir = await _getAppDirPath();

    final config = await AppConfig.load(appSettingsDirectory: appDir);

    return config;
  }

  Future<void> addToCache(String id, String dirPath) async {
    final val = state.value!;
    val.cachedProjectPaths.putIfAbsent(id, () => dirPath);

    state = AsyncValue.data(val);

    await val.save(appSettingsDirectory: await _getAppDirPath());
  }

  Future<String> _getAppDirPath() async =>
      join((await getLibraryDirectory()).path, 'Fluid RPC');
}
