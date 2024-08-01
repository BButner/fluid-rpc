// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.1.0.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../../../../frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

// These function are ignored because they are on traits that is not defined in current crate (put an empty `#[frb]` on it to unignore): `fmt`

class TlsTypeOneWay {
  final String certificatePath;

  const TlsTypeOneWay({
    required this.certificatePath,
  });

  @override
  int get hashCode => certificatePath.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TlsTypeOneWay &&
          runtimeType == other.runtimeType &&
          certificatePath == other.certificatePath;
}
