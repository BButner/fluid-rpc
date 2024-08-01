import 'package:frpc_gui/src/rust/api/models/config/app_config.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_config_provider.g.dart';

@riverpod
class ApplicationConfig extends _$ApplicationConfig {
  @override
  Future<AppConfig> build() async {
    final appDir = await getApplicationDocumentsDirectory();

    final config = await AppConfig.load(path: '${appDir.path}/config.json');

    return config;
  }
}
