// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.1.0.

// ignore_for_file: unused_import, unused_element, unnecessary_import, duplicate_ignore, invalid_use_of_internal_member, annotate_overrides, non_constant_identifier_names, curly_braces_in_flow_control_structures, prefer_const_literals_to_create_immutables, unused_field

// Static analysis wrongly picks the IO variant, thus ignore this
// ignore_for_file: argument_type_not_assignable

import 'api/models/config/app_config.dart';
import 'api/models/connection/connection_config.dart';
import 'api/models/connection/tls_type.dart';
import 'api/models/connection/tls_types/tls_type_one_way.dart';
import 'api/models/connection/tls_types/tls_type_two_way.dart';
import 'api/models/descriptors/enum_descriptor.dart';
import 'api/models/descriptors/field_descriptor.dart';
import 'api/models/descriptors/field_type_descriptor.dart';
import 'api/models/descriptors/message_descriptor.dart';
import 'api/models/descriptors/method_descriptor.dart';
import 'api/models/descriptors/oneof_descriptor.dart';
import 'api/models/descriptors/server_descriptor.dart';
import 'api/models/descriptors/service_descriptor.dart';
import 'api/models/environment/environment.dart';
import 'api/models/project/project.dart';
import 'api/models/stream_event.dart';
import 'api/simple.dart';
import 'dart:async';
import 'dart:convert';
import 'frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated_web.dart';

abstract class RustLibApiImplPlatform extends BaseApiImpl<RustLibWire> {
  RustLibApiImplPlatform({
    required super.handler,
    required super.wire,
    required super.generalizedFrbRustBinding,
    required super.portManager,
  });

  CrossPlatformFinalizerArg
      get rust_arc_decrement_strong_count_CancelableExecutionPtr => wire
          .rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerCancelableExecution;

  @protected
  AnyhowException dco_decode_AnyhowException(dynamic raw);

  @protected
  CancelableExecution
      dco_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerCancelableExecution(
          dynamic raw);

  @protected
  CancelableExecution
      dco_decode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerCancelableExecution(
          dynamic raw);

  @protected
  DateTime dco_decode_Chrono_Local(dynamic raw);

  @protected
  Map<String, String> dco_decode_Map_String_String(dynamic raw);

  @protected
  CancelableExecution
      dco_decode_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerCancelableExecution(
          dynamic raw);

  @protected
  RustStreamSink<String> dco_decode_StreamSink_String_Sse(dynamic raw);

  @protected
  RustStreamSink<FluidFrontendStreamEvent>
      dco_decode_StreamSink_fluid_frontend_stream_event_Sse(dynamic raw);

  @protected
  String dco_decode_String(dynamic raw);

  @protected
  AppConfig dco_decode_app_config(dynamic raw);

  @protected
  bool dco_decode_bool(dynamic raw);

  @protected
  AppConfig dco_decode_box_autoadd_app_config(dynamic raw);

  @protected
  EnumDescriptor dco_decode_box_autoadd_enum_descriptor(dynamic raw);

  @protected
  FileProjectLoader dco_decode_box_autoadd_file_project_loader(dynamic raw);

  @protected
  FluidError dco_decode_box_autoadd_fluid_error(dynamic raw);

  @protected
  FluidMessageReceived dco_decode_box_autoadd_fluid_message_received(
      dynamic raw);

  @protected
  LoadedProject dco_decode_box_autoadd_loaded_project(dynamic raw);

  @protected
  MessageDescriptor dco_decode_box_autoadd_message_descriptor(dynamic raw);

  @protected
  MethodDescriptor dco_decode_box_autoadd_method_descriptor(dynamic raw);

  @protected
  Project dco_decode_box_autoadd_project(dynamic raw);

  @protected
  ServerDescriptor dco_decode_box_autoadd_server_descriptor(dynamic raw);

  @protected
  TlsTypeOneWay dco_decode_box_autoadd_tls_type_one_way(dynamic raw);

  @protected
  TlsTypeTwoWay dco_decode_box_autoadd_tls_type_two_way(dynamic raw);

  @protected
  ConnectionConfig dco_decode_connection_config(dynamic raw);

  @protected
  EnumDescriptor dco_decode_enum_descriptor(dynamic raw);

  @protected
  EnumValueDescriptor dco_decode_enum_value_descriptor(dynamic raw);

  @protected
  Environment dco_decode_environment(dynamic raw);

  @protected
  FieldDescriptor dco_decode_field_descriptor(dynamic raw);

  @protected
  FieldTypeDescriptor dco_decode_field_type_descriptor(dynamic raw);

  @protected
  FileProjectLoader dco_decode_file_project_loader(dynamic raw);

  @protected
  FluidError dco_decode_fluid_error(dynamic raw);

  @protected
  FluidFrontendStreamEvent dco_decode_fluid_frontend_stream_event(dynamic raw);

  @protected
  FluidMessageReceived dco_decode_fluid_message_received(dynamic raw);

  @protected
  int dco_decode_i_32(dynamic raw);

  @protected
  PlatformInt64 dco_decode_i_64(dynamic raw);

  @protected
  List<String> dco_decode_list_String(dynamic raw);

  @protected
  List<EnumValueDescriptor> dco_decode_list_enum_value_descriptor(dynamic raw);

  @protected
  List<Environment> dco_decode_list_environment(dynamic raw);

  @protected
  List<FieldDescriptor> dco_decode_list_field_descriptor(dynamic raw);

  @protected
  List<MethodDescriptor> dco_decode_list_method_descriptor(dynamic raw);

  @protected
  List<OneOfDescriptor> dco_decode_list_one_of_descriptor(dynamic raw);

  @protected
  Uint8List dco_decode_list_prim_u_8_strict(dynamic raw);

  @protected
  List<(String, String)> dco_decode_list_record_string_string(dynamic raw);

  @protected
  List<ServiceDescriptor> dco_decode_list_service_descriptor(dynamic raw);

  @protected
  LoadedProject dco_decode_loaded_project(dynamic raw);

  @protected
  MessageDescriptor dco_decode_message_descriptor(dynamic raw);

  @protected
  MethodDescriptor dco_decode_method_descriptor(dynamic raw);

  @protected
  OneOfDescriptor dco_decode_one_of_descriptor(dynamic raw);

  @protected
  String? dco_decode_opt_String(dynamic raw);

  @protected
  LoadedProject? dco_decode_opt_box_autoadd_loaded_project(dynamic raw);

  @protected
  Project dco_decode_project(dynamic raw);

  @protected
  ProjectLoader dco_decode_project_loader(dynamic raw);

  @protected
  (String, String) dco_decode_record_string_string(dynamic raw);

  @protected
  ReflectionVersionMode dco_decode_reflection_version_mode(dynamic raw);

  @protected
  ServerDescriptor dco_decode_server_descriptor(dynamic raw);

  @protected
  ServiceDescriptor dco_decode_service_descriptor(dynamic raw);

  @protected
  TlsType dco_decode_tls_type(dynamic raw);

  @protected
  TlsTypeOneWay dco_decode_tls_type_one_way(dynamic raw);

  @protected
  TlsTypeTwoWay dco_decode_tls_type_two_way(dynamic raw);

  @protected
  int dco_decode_u_16(dynamic raw);

  @protected
  int dco_decode_u_32(dynamic raw);

  @protected
  int dco_decode_u_8(dynamic raw);

  @protected
  void dco_decode_unit(dynamic raw);

  @protected
  BigInt dco_decode_usize(dynamic raw);

  @protected
  AnyhowException sse_decode_AnyhowException(SseDeserializer deserializer);

  @protected
  CancelableExecution
      sse_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerCancelableExecution(
          SseDeserializer deserializer);

  @protected
  CancelableExecution
      sse_decode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerCancelableExecution(
          SseDeserializer deserializer);

  @protected
  DateTime sse_decode_Chrono_Local(SseDeserializer deserializer);

  @protected
  Map<String, String> sse_decode_Map_String_String(
      SseDeserializer deserializer);

  @protected
  CancelableExecution
      sse_decode_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerCancelableExecution(
          SseDeserializer deserializer);

  @protected
  RustStreamSink<String> sse_decode_StreamSink_String_Sse(
      SseDeserializer deserializer);

  @protected
  RustStreamSink<FluidFrontendStreamEvent>
      sse_decode_StreamSink_fluid_frontend_stream_event_Sse(
          SseDeserializer deserializer);

  @protected
  String sse_decode_String(SseDeserializer deserializer);

  @protected
  AppConfig sse_decode_app_config(SseDeserializer deserializer);

  @protected
  bool sse_decode_bool(SseDeserializer deserializer);

  @protected
  AppConfig sse_decode_box_autoadd_app_config(SseDeserializer deserializer);

  @protected
  EnumDescriptor sse_decode_box_autoadd_enum_descriptor(
      SseDeserializer deserializer);

  @protected
  FileProjectLoader sse_decode_box_autoadd_file_project_loader(
      SseDeserializer deserializer);

  @protected
  FluidError sse_decode_box_autoadd_fluid_error(SseDeserializer deserializer);

  @protected
  FluidMessageReceived sse_decode_box_autoadd_fluid_message_received(
      SseDeserializer deserializer);

  @protected
  LoadedProject sse_decode_box_autoadd_loaded_project(
      SseDeserializer deserializer);

  @protected
  MessageDescriptor sse_decode_box_autoadd_message_descriptor(
      SseDeserializer deserializer);

  @protected
  MethodDescriptor sse_decode_box_autoadd_method_descriptor(
      SseDeserializer deserializer);

  @protected
  Project sse_decode_box_autoadd_project(SseDeserializer deserializer);

  @protected
  ServerDescriptor sse_decode_box_autoadd_server_descriptor(
      SseDeserializer deserializer);

  @protected
  TlsTypeOneWay sse_decode_box_autoadd_tls_type_one_way(
      SseDeserializer deserializer);

  @protected
  TlsTypeTwoWay sse_decode_box_autoadd_tls_type_two_way(
      SseDeserializer deserializer);

  @protected
  ConnectionConfig sse_decode_connection_config(SseDeserializer deserializer);

  @protected
  EnumDescriptor sse_decode_enum_descriptor(SseDeserializer deserializer);

  @protected
  EnumValueDescriptor sse_decode_enum_value_descriptor(
      SseDeserializer deserializer);

  @protected
  Environment sse_decode_environment(SseDeserializer deserializer);

  @protected
  FieldDescriptor sse_decode_field_descriptor(SseDeserializer deserializer);

  @protected
  FieldTypeDescriptor sse_decode_field_type_descriptor(
      SseDeserializer deserializer);

  @protected
  FileProjectLoader sse_decode_file_project_loader(
      SseDeserializer deserializer);

  @protected
  FluidError sse_decode_fluid_error(SseDeserializer deserializer);

  @protected
  FluidFrontendStreamEvent sse_decode_fluid_frontend_stream_event(
      SseDeserializer deserializer);

  @protected
  FluidMessageReceived sse_decode_fluid_message_received(
      SseDeserializer deserializer);

  @protected
  int sse_decode_i_32(SseDeserializer deserializer);

  @protected
  PlatformInt64 sse_decode_i_64(SseDeserializer deserializer);

  @protected
  List<String> sse_decode_list_String(SseDeserializer deserializer);

  @protected
  List<EnumValueDescriptor> sse_decode_list_enum_value_descriptor(
      SseDeserializer deserializer);

  @protected
  List<Environment> sse_decode_list_environment(SseDeserializer deserializer);

  @protected
  List<FieldDescriptor> sse_decode_list_field_descriptor(
      SseDeserializer deserializer);

  @protected
  List<MethodDescriptor> sse_decode_list_method_descriptor(
      SseDeserializer deserializer);

  @protected
  List<OneOfDescriptor> sse_decode_list_one_of_descriptor(
      SseDeserializer deserializer);

  @protected
  Uint8List sse_decode_list_prim_u_8_strict(SseDeserializer deserializer);

  @protected
  List<(String, String)> sse_decode_list_record_string_string(
      SseDeserializer deserializer);

  @protected
  List<ServiceDescriptor> sse_decode_list_service_descriptor(
      SseDeserializer deserializer);

  @protected
  LoadedProject sse_decode_loaded_project(SseDeserializer deserializer);

  @protected
  MessageDescriptor sse_decode_message_descriptor(SseDeserializer deserializer);

  @protected
  MethodDescriptor sse_decode_method_descriptor(SseDeserializer deserializer);

  @protected
  OneOfDescriptor sse_decode_one_of_descriptor(SseDeserializer deserializer);

  @protected
  String? sse_decode_opt_String(SseDeserializer deserializer);

  @protected
  LoadedProject? sse_decode_opt_box_autoadd_loaded_project(
      SseDeserializer deserializer);

  @protected
  Project sse_decode_project(SseDeserializer deserializer);

  @protected
  ProjectLoader sse_decode_project_loader(SseDeserializer deserializer);

  @protected
  (String, String) sse_decode_record_string_string(
      SseDeserializer deserializer);

  @protected
  ReflectionVersionMode sse_decode_reflection_version_mode(
      SseDeserializer deserializer);

  @protected
  ServerDescriptor sse_decode_server_descriptor(SseDeserializer deserializer);

  @protected
  ServiceDescriptor sse_decode_service_descriptor(SseDeserializer deserializer);

  @protected
  TlsType sse_decode_tls_type(SseDeserializer deserializer);

  @protected
  TlsTypeOneWay sse_decode_tls_type_one_way(SseDeserializer deserializer);

  @protected
  TlsTypeTwoWay sse_decode_tls_type_two_way(SseDeserializer deserializer);

  @protected
  int sse_decode_u_16(SseDeserializer deserializer);

  @protected
  int sse_decode_u_32(SseDeserializer deserializer);

  @protected
  int sse_decode_u_8(SseDeserializer deserializer);

  @protected
  void sse_decode_unit(SseDeserializer deserializer);

  @protected
  BigInt sse_decode_usize(SseDeserializer deserializer);

  @protected
  void sse_encode_AnyhowException(
      AnyhowException self, SseSerializer serializer);

  @protected
  void
      sse_encode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerCancelableExecution(
          CancelableExecution self, SseSerializer serializer);

  @protected
  void
      sse_encode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerCancelableExecution(
          CancelableExecution self, SseSerializer serializer);

  @protected
  void sse_encode_Chrono_Local(DateTime self, SseSerializer serializer);

  @protected
  void sse_encode_Map_String_String(
      Map<String, String> self, SseSerializer serializer);

  @protected
  void
      sse_encode_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerCancelableExecution(
          CancelableExecution self, SseSerializer serializer);

  @protected
  void sse_encode_StreamSink_String_Sse(
      RustStreamSink<String> self, SseSerializer serializer);

  @protected
  void sse_encode_StreamSink_fluid_frontend_stream_event_Sse(
      RustStreamSink<FluidFrontendStreamEvent> self, SseSerializer serializer);

  @protected
  void sse_encode_String(String self, SseSerializer serializer);

  @protected
  void sse_encode_app_config(AppConfig self, SseSerializer serializer);

  @protected
  void sse_encode_bool(bool self, SseSerializer serializer);

  @protected
  void sse_encode_box_autoadd_app_config(
      AppConfig self, SseSerializer serializer);

  @protected
  void sse_encode_box_autoadd_enum_descriptor(
      EnumDescriptor self, SseSerializer serializer);

  @protected
  void sse_encode_box_autoadd_file_project_loader(
      FileProjectLoader self, SseSerializer serializer);

  @protected
  void sse_encode_box_autoadd_fluid_error(
      FluidError self, SseSerializer serializer);

  @protected
  void sse_encode_box_autoadd_fluid_message_received(
      FluidMessageReceived self, SseSerializer serializer);

  @protected
  void sse_encode_box_autoadd_loaded_project(
      LoadedProject self, SseSerializer serializer);

  @protected
  void sse_encode_box_autoadd_message_descriptor(
      MessageDescriptor self, SseSerializer serializer);

  @protected
  void sse_encode_box_autoadd_method_descriptor(
      MethodDescriptor self, SseSerializer serializer);

  @protected
  void sse_encode_box_autoadd_project(Project self, SseSerializer serializer);

  @protected
  void sse_encode_box_autoadd_server_descriptor(
      ServerDescriptor self, SseSerializer serializer);

  @protected
  void sse_encode_box_autoadd_tls_type_one_way(
      TlsTypeOneWay self, SseSerializer serializer);

  @protected
  void sse_encode_box_autoadd_tls_type_two_way(
      TlsTypeTwoWay self, SseSerializer serializer);

  @protected
  void sse_encode_connection_config(
      ConnectionConfig self, SseSerializer serializer);

  @protected
  void sse_encode_enum_descriptor(
      EnumDescriptor self, SseSerializer serializer);

  @protected
  void sse_encode_enum_value_descriptor(
      EnumValueDescriptor self, SseSerializer serializer);

  @protected
  void sse_encode_environment(Environment self, SseSerializer serializer);

  @protected
  void sse_encode_field_descriptor(
      FieldDescriptor self, SseSerializer serializer);

  @protected
  void sse_encode_field_type_descriptor(
      FieldTypeDescriptor self, SseSerializer serializer);

  @protected
  void sse_encode_file_project_loader(
      FileProjectLoader self, SseSerializer serializer);

  @protected
  void sse_encode_fluid_error(FluidError self, SseSerializer serializer);

  @protected
  void sse_encode_fluid_frontend_stream_event(
      FluidFrontendStreamEvent self, SseSerializer serializer);

  @protected
  void sse_encode_fluid_message_received(
      FluidMessageReceived self, SseSerializer serializer);

  @protected
  void sse_encode_i_32(int self, SseSerializer serializer);

  @protected
  void sse_encode_i_64(PlatformInt64 self, SseSerializer serializer);

  @protected
  void sse_encode_list_String(List<String> self, SseSerializer serializer);

  @protected
  void sse_encode_list_enum_value_descriptor(
      List<EnumValueDescriptor> self, SseSerializer serializer);

  @protected
  void sse_encode_list_environment(
      List<Environment> self, SseSerializer serializer);

  @protected
  void sse_encode_list_field_descriptor(
      List<FieldDescriptor> self, SseSerializer serializer);

  @protected
  void sse_encode_list_method_descriptor(
      List<MethodDescriptor> self, SseSerializer serializer);

  @protected
  void sse_encode_list_one_of_descriptor(
      List<OneOfDescriptor> self, SseSerializer serializer);

  @protected
  void sse_encode_list_prim_u_8_strict(
      Uint8List self, SseSerializer serializer);

  @protected
  void sse_encode_list_record_string_string(
      List<(String, String)> self, SseSerializer serializer);

  @protected
  void sse_encode_list_service_descriptor(
      List<ServiceDescriptor> self, SseSerializer serializer);

  @protected
  void sse_encode_loaded_project(LoadedProject self, SseSerializer serializer);

  @protected
  void sse_encode_message_descriptor(
      MessageDescriptor self, SseSerializer serializer);

  @protected
  void sse_encode_method_descriptor(
      MethodDescriptor self, SseSerializer serializer);

  @protected
  void sse_encode_one_of_descriptor(
      OneOfDescriptor self, SseSerializer serializer);

  @protected
  void sse_encode_opt_String(String? self, SseSerializer serializer);

  @protected
  void sse_encode_opt_box_autoadd_loaded_project(
      LoadedProject? self, SseSerializer serializer);

  @protected
  void sse_encode_project(Project self, SseSerializer serializer);

  @protected
  void sse_encode_project_loader(ProjectLoader self, SseSerializer serializer);

  @protected
  void sse_encode_record_string_string(
      (String, String) self, SseSerializer serializer);

  @protected
  void sse_encode_reflection_version_mode(
      ReflectionVersionMode self, SseSerializer serializer);

  @protected
  void sse_encode_server_descriptor(
      ServerDescriptor self, SseSerializer serializer);

  @protected
  void sse_encode_service_descriptor(
      ServiceDescriptor self, SseSerializer serializer);

  @protected
  void sse_encode_tls_type(TlsType self, SseSerializer serializer);

  @protected
  void sse_encode_tls_type_one_way(
      TlsTypeOneWay self, SseSerializer serializer);

  @protected
  void sse_encode_tls_type_two_way(
      TlsTypeTwoWay self, SseSerializer serializer);

  @protected
  void sse_encode_u_16(int self, SseSerializer serializer);

  @protected
  void sse_encode_u_32(int self, SseSerializer serializer);

  @protected
  void sse_encode_u_8(int self, SseSerializer serializer);

  @protected
  void sse_encode_unit(void self, SseSerializer serializer);

  @protected
  void sse_encode_usize(BigInt self, SseSerializer serializer);
}

// Section: wire_class

class RustLibWire implements BaseWire {
  RustLibWire.fromExternalLibrary(ExternalLibrary lib);

  void rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerCancelableExecution(
          int ptr) =>
      wasmModule
          .rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerCancelableExecution(
              ptr);

  void rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerCancelableExecution(
          int ptr) =>
      wasmModule
          .rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerCancelableExecution(
              ptr);
}

@JS('wasm_bindgen')
external RustLibWasmModule get wasmModule;

@JS()
@anonymous
extension type RustLibWasmModule._(JSObject _) implements JSObject {
  external void
      rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerCancelableExecution(
          int ptr);

  external void
      rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerCancelableExecution(
          int ptr);
}
