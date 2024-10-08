// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.1.0.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../../../../../frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';
import 'server_reflection_request.dart';

// These function are ignored because they are on traits that is not defined in current crate (put an empty `#[frb]` on it to unignore): `clone`, `eq`, `fmt`

// Rust type: RustOpaqueMoi<flutter_rust_bridge::for_generated::RustAutoOpaqueInner< MessageResponse>>
abstract class MessageResponse implements RustOpaqueInterface {
  /// Encodes the message to a buffer.
  Future<void> encode({required BufMut buf});

  /// Returns the encoded length of the message without a length delimiter.
  Future<BigInt> encodedLen();

  /// Decodes an instance of the message from a buffer, and merges it into self.
  static Future<void> merge(
          {required OptionMessageResponse field,
          required int tag,
          required WireType wireType,
          required Buf buf,
          required DecodeContext ctx}) =>
      RustLib.instance.api
          .frpcLibLoaderReflectionLoaderReflectionServerReflectionResponseMessageResponseMerge(
              field: field, tag: tag, wireType: wireType, buf: buf, ctx: ctx);
}

// Rust type: RustOpaqueMoi<flutter_rust_bridge::for_generated::RustAutoOpaqueInner<:: Option < MessageResponse >>>
abstract class OptionMessageResponse implements RustOpaqueInterface {}
