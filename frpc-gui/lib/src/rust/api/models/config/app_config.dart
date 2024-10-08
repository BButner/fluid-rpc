// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.1.0.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../../../frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

// These functions are ignored because they are not marked as `pub`: `add_update_cached_project`
// These function are ignored because they are on traits that is not defined in current crate (put an empty `#[frb]` on it to unignore): `fmt`

class AppConfig {
  final Map<String, String> cachedProjectPaths;

  const AppConfig({
    required this.cachedProjectPaths,
  });

  static Future<AppConfig> load({required String appSettingsDirectory}) =>
      RustLib.instance.api.crateApiModelsConfigAppConfigAppConfigLoad(
          appSettingsDirectory: appSettingsDirectory);

  // HINT: Make it `#[frb(sync)]` to let it become the default constructor of Dart class.
  static Future<AppConfig> newInstance() =>
      RustLib.instance.api.crateApiModelsConfigAppConfigAppConfigNew();

  Future<void> save({required String appSettingsDirectory}) =>
      RustLib.instance.api.crateApiModelsConfigAppConfigAppConfigSave(
          that: this, appSettingsDirectory: appSettingsDirectory);

  @override
  int get hashCode => cachedProjectPaths.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppConfig &&
          runtimeType == other.runtimeType &&
          cachedProjectPaths == other.cachedProjectPaths;
}
