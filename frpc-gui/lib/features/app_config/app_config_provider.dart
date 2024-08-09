import 'dart:ffi';

import 'package:frpc_gui/src/rust/api/models/config/app_config.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_config_provider.g.dart';

@riverpod
class ApplicationConfig extends _$ApplicationConfig {
  @override
  Future<AppConfig> build() async {
    final appDir = await getApplicationDocumentsDirectory();

    print(appDir);

    final config = await AppConfig.load(appSettingsDirectory: appDir.path);

    print(config.cachedProjectPaths);

    return config;
  }

  Future<void> addToCache(String id, String dirPath) async {
    final val = state.value!;
    val.cachedProjectPaths.putIfAbsent(id, () => dirPath);

    print(val.cachedProjectPaths);

    state = AsyncValue.data(val);

    await val.save(
        appSettingsDirectory: (await getApplicationDocumentsDirectory()).path);
  }
}
