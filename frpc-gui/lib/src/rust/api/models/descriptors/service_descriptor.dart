// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.1.0.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../../../frb_generated.dart';
import 'enum_descriptor.dart';
import 'field_descriptor.dart';
import 'field_type_descriptor.dart';
import 'message_descriptor.dart';
import 'method_descriptor.dart';
import 'oneof_descriptor.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

// These function are ignored because they are on traits that is not defined in current crate (put an empty `#[frb]` on it to unignore): `clone`, `fmt`, `from`

class ServiceDescriptor {
  final String name;
  final String filePath;
  final List<MethodDescriptor> methods;

  const ServiceDescriptor({
    required this.name,
    required this.filePath,
    required this.methods,
  });

  @override
  int get hashCode => name.hashCode ^ filePath.hashCode ^ methods.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ServiceDescriptor &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          filePath == other.filePath &&
          methods == other.methods;
}
