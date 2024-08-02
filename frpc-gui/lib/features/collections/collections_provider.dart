import 'package:frpc_gui/features/app_config/app_config_provider.dart';
import 'package:frpc_gui/src/rust/api/models/collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'collections_provider.g.dart';

@riverpod
class Collections extends _$Collections {
  @override
  Future<List<Collection>> build() async {
    final appConfig = await ref.watch(applicationConfigProvider.future);

    return appConfig.collections;
  }
}
