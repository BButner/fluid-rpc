// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.1.0.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

Future<void> listFromServerReflection({required String serverUrl}) =>
    RustLib.instance.api.frpcLibListFromServerReflection(serverUrl: serverUrl);

Future<void> listFromFiles(
        {required List<String> filePaths,
        required List<String> includePaths}) =>
    RustLib.instance.api
        .frpcLibListFromFiles(filePaths: filePaths, includePaths: includePaths);

Future<UnboundedReceiverFluidStreamEvent> invokeMethod(
        {required String serverUrl,
        required String targetMethod,
        String? data,
        List<String>? filePaths,
        List<String>? includePaths}) =>
    RustLib.instance.api.frpcLibInvokeMethod(
        serverUrl: serverUrl,
        targetMethod: targetMethod,
        data: data,
        filePaths: filePaths,
        includePaths: includePaths);

// Rust type: RustOpaqueMoi<flutter_rust_bridge::for_generated::RustAutoOpaqueInner<UnboundedReceiver < FluidStreamEvent >>>
abstract class UnboundedReceiverFluidStreamEvent
    implements RustOpaqueInterface {}
