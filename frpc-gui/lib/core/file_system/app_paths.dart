import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class AppPaths {
  static Future<Directory> getCollectionDirectory(String id) async {
    final appDir = await getApplicationDocumentsDirectory();

    return Directory(join(appDir.path, _collectionsDirName, id));
  }

  static const String _collectionsDirName = 'Collections';
}
