// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stream_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FluidFrontendStreamEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime field0) initiatingConnection,
    required TResult Function(DateTime field0) connected,
    required TResult Function(FluidError field0) error,
    required TResult Function(FluidMessageReceived message)
        streamingMessageReceived,
    required TResult Function(FluidMessageReceived message)
        unaryMessageReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime field0)? initiatingConnection,
    TResult? Function(DateTime field0)? connected,
    TResult? Function(FluidError field0)? error,
    TResult? Function(FluidMessageReceived message)? streamingMessageReceived,
    TResult? Function(FluidMessageReceived message)? unaryMessageReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime field0)? initiatingConnection,
    TResult Function(DateTime field0)? connected,
    TResult Function(FluidError field0)? error,
    TResult Function(FluidMessageReceived message)? streamingMessageReceived,
    TResult Function(FluidMessageReceived message)? unaryMessageReceived,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(
            FluidFrontendStreamEvent_InitiatingConnection value)
        initiatingConnection,
    required TResult Function(FluidFrontendStreamEvent_Connected value)
        connected,
    required TResult Function(FluidFrontendStreamEvent_Error value) error,
    required TResult Function(
            FluidFrontendStreamEvent_StreamingMessageReceived value)
        streamingMessageReceived,
    required TResult Function(
            FluidFrontendStreamEvent_UnaryMessageReceived value)
        unaryMessageReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FluidFrontendStreamEvent_InitiatingConnection value)?
        initiatingConnection,
    TResult? Function(FluidFrontendStreamEvent_Connected value)? connected,
    TResult? Function(FluidFrontendStreamEvent_Error value)? error,
    TResult? Function(FluidFrontendStreamEvent_StreamingMessageReceived value)?
        streamingMessageReceived,
    TResult? Function(FluidFrontendStreamEvent_UnaryMessageReceived value)?
        unaryMessageReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FluidFrontendStreamEvent_InitiatingConnection value)?
        initiatingConnection,
    TResult Function(FluidFrontendStreamEvent_Connected value)? connected,
    TResult Function(FluidFrontendStreamEvent_Error value)? error,
    TResult Function(FluidFrontendStreamEvent_StreamingMessageReceived value)?
        streamingMessageReceived,
    TResult Function(FluidFrontendStreamEvent_UnaryMessageReceived value)?
        unaryMessageReceived,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FluidFrontendStreamEventCopyWith<$Res> {
  factory $FluidFrontendStreamEventCopyWith(FluidFrontendStreamEvent value,
          $Res Function(FluidFrontendStreamEvent) then) =
      _$FluidFrontendStreamEventCopyWithImpl<$Res, FluidFrontendStreamEvent>;
}

/// @nodoc
class _$FluidFrontendStreamEventCopyWithImpl<$Res,
        $Val extends FluidFrontendStreamEvent>
    implements $FluidFrontendStreamEventCopyWith<$Res> {
  _$FluidFrontendStreamEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FluidFrontendStreamEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FluidFrontendStreamEvent_InitiatingConnectionImplCopyWith<
    $Res> {
  factory _$$FluidFrontendStreamEvent_InitiatingConnectionImplCopyWith(
          _$FluidFrontendStreamEvent_InitiatingConnectionImpl value,
          $Res Function(_$FluidFrontendStreamEvent_InitiatingConnectionImpl)
              then) =
      __$$FluidFrontendStreamEvent_InitiatingConnectionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime field0});
}

/// @nodoc
class __$$FluidFrontendStreamEvent_InitiatingConnectionImplCopyWithImpl<$Res>
    extends _$FluidFrontendStreamEventCopyWithImpl<$Res,
        _$FluidFrontendStreamEvent_InitiatingConnectionImpl>
    implements
        _$$FluidFrontendStreamEvent_InitiatingConnectionImplCopyWith<$Res> {
  __$$FluidFrontendStreamEvent_InitiatingConnectionImplCopyWithImpl(
      _$FluidFrontendStreamEvent_InitiatingConnectionImpl _value,
      $Res Function(_$FluidFrontendStreamEvent_InitiatingConnectionImpl) _then)
      : super(_value, _then);

  /// Create a copy of FluidFrontendStreamEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$FluidFrontendStreamEvent_InitiatingConnectionImpl(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$FluidFrontendStreamEvent_InitiatingConnectionImpl
    extends FluidFrontendStreamEvent_InitiatingConnection {
  const _$FluidFrontendStreamEvent_InitiatingConnectionImpl(this.field0)
      : super._();

  @override
  final DateTime field0;

  @override
  String toString() {
    return 'FluidFrontendStreamEvent.initiatingConnection(field0: $field0)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FluidFrontendStreamEvent_InitiatingConnectionImpl &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  /// Create a copy of FluidFrontendStreamEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FluidFrontendStreamEvent_InitiatingConnectionImplCopyWith<
          _$FluidFrontendStreamEvent_InitiatingConnectionImpl>
      get copyWith =>
          __$$FluidFrontendStreamEvent_InitiatingConnectionImplCopyWithImpl<
                  _$FluidFrontendStreamEvent_InitiatingConnectionImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime field0) initiatingConnection,
    required TResult Function(DateTime field0) connected,
    required TResult Function(FluidError field0) error,
    required TResult Function(FluidMessageReceived message)
        streamingMessageReceived,
    required TResult Function(FluidMessageReceived message)
        unaryMessageReceived,
  }) {
    return initiatingConnection(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime field0)? initiatingConnection,
    TResult? Function(DateTime field0)? connected,
    TResult? Function(FluidError field0)? error,
    TResult? Function(FluidMessageReceived message)? streamingMessageReceived,
    TResult? Function(FluidMessageReceived message)? unaryMessageReceived,
  }) {
    return initiatingConnection?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime field0)? initiatingConnection,
    TResult Function(DateTime field0)? connected,
    TResult Function(FluidError field0)? error,
    TResult Function(FluidMessageReceived message)? streamingMessageReceived,
    TResult Function(FluidMessageReceived message)? unaryMessageReceived,
    required TResult orElse(),
  }) {
    if (initiatingConnection != null) {
      return initiatingConnection(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(
            FluidFrontendStreamEvent_InitiatingConnection value)
        initiatingConnection,
    required TResult Function(FluidFrontendStreamEvent_Connected value)
        connected,
    required TResult Function(FluidFrontendStreamEvent_Error value) error,
    required TResult Function(
            FluidFrontendStreamEvent_StreamingMessageReceived value)
        streamingMessageReceived,
    required TResult Function(
            FluidFrontendStreamEvent_UnaryMessageReceived value)
        unaryMessageReceived,
  }) {
    return initiatingConnection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FluidFrontendStreamEvent_InitiatingConnection value)?
        initiatingConnection,
    TResult? Function(FluidFrontendStreamEvent_Connected value)? connected,
    TResult? Function(FluidFrontendStreamEvent_Error value)? error,
    TResult? Function(FluidFrontendStreamEvent_StreamingMessageReceived value)?
        streamingMessageReceived,
    TResult? Function(FluidFrontendStreamEvent_UnaryMessageReceived value)?
        unaryMessageReceived,
  }) {
    return initiatingConnection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FluidFrontendStreamEvent_InitiatingConnection value)?
        initiatingConnection,
    TResult Function(FluidFrontendStreamEvent_Connected value)? connected,
    TResult Function(FluidFrontendStreamEvent_Error value)? error,
    TResult Function(FluidFrontendStreamEvent_StreamingMessageReceived value)?
        streamingMessageReceived,
    TResult Function(FluidFrontendStreamEvent_UnaryMessageReceived value)?
        unaryMessageReceived,
    required TResult orElse(),
  }) {
    if (initiatingConnection != null) {
      return initiatingConnection(this);
    }
    return orElse();
  }
}

abstract class FluidFrontendStreamEvent_InitiatingConnection
    extends FluidFrontendStreamEvent {
  const factory FluidFrontendStreamEvent_InitiatingConnection(
          final DateTime field0) =
      _$FluidFrontendStreamEvent_InitiatingConnectionImpl;
  const FluidFrontendStreamEvent_InitiatingConnection._() : super._();

  DateTime get field0;

  /// Create a copy of FluidFrontendStreamEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FluidFrontendStreamEvent_InitiatingConnectionImplCopyWith<
          _$FluidFrontendStreamEvent_InitiatingConnectionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FluidFrontendStreamEvent_ConnectedImplCopyWith<$Res> {
  factory _$$FluidFrontendStreamEvent_ConnectedImplCopyWith(
          _$FluidFrontendStreamEvent_ConnectedImpl value,
          $Res Function(_$FluidFrontendStreamEvent_ConnectedImpl) then) =
      __$$FluidFrontendStreamEvent_ConnectedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime field0});
}

/// @nodoc
class __$$FluidFrontendStreamEvent_ConnectedImplCopyWithImpl<$Res>
    extends _$FluidFrontendStreamEventCopyWithImpl<$Res,
        _$FluidFrontendStreamEvent_ConnectedImpl>
    implements _$$FluidFrontendStreamEvent_ConnectedImplCopyWith<$Res> {
  __$$FluidFrontendStreamEvent_ConnectedImplCopyWithImpl(
      _$FluidFrontendStreamEvent_ConnectedImpl _value,
      $Res Function(_$FluidFrontendStreamEvent_ConnectedImpl) _then)
      : super(_value, _then);

  /// Create a copy of FluidFrontendStreamEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$FluidFrontendStreamEvent_ConnectedImpl(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$FluidFrontendStreamEvent_ConnectedImpl
    extends FluidFrontendStreamEvent_Connected {
  const _$FluidFrontendStreamEvent_ConnectedImpl(this.field0) : super._();

  @override
  final DateTime field0;

  @override
  String toString() {
    return 'FluidFrontendStreamEvent.connected(field0: $field0)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FluidFrontendStreamEvent_ConnectedImpl &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  /// Create a copy of FluidFrontendStreamEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FluidFrontendStreamEvent_ConnectedImplCopyWith<
          _$FluidFrontendStreamEvent_ConnectedImpl>
      get copyWith => __$$FluidFrontendStreamEvent_ConnectedImplCopyWithImpl<
          _$FluidFrontendStreamEvent_ConnectedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime field0) initiatingConnection,
    required TResult Function(DateTime field0) connected,
    required TResult Function(FluidError field0) error,
    required TResult Function(FluidMessageReceived message)
        streamingMessageReceived,
    required TResult Function(FluidMessageReceived message)
        unaryMessageReceived,
  }) {
    return connected(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime field0)? initiatingConnection,
    TResult? Function(DateTime field0)? connected,
    TResult? Function(FluidError field0)? error,
    TResult? Function(FluidMessageReceived message)? streamingMessageReceived,
    TResult? Function(FluidMessageReceived message)? unaryMessageReceived,
  }) {
    return connected?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime field0)? initiatingConnection,
    TResult Function(DateTime field0)? connected,
    TResult Function(FluidError field0)? error,
    TResult Function(FluidMessageReceived message)? streamingMessageReceived,
    TResult Function(FluidMessageReceived message)? unaryMessageReceived,
    required TResult orElse(),
  }) {
    if (connected != null) {
      return connected(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(
            FluidFrontendStreamEvent_InitiatingConnection value)
        initiatingConnection,
    required TResult Function(FluidFrontendStreamEvent_Connected value)
        connected,
    required TResult Function(FluidFrontendStreamEvent_Error value) error,
    required TResult Function(
            FluidFrontendStreamEvent_StreamingMessageReceived value)
        streamingMessageReceived,
    required TResult Function(
            FluidFrontendStreamEvent_UnaryMessageReceived value)
        unaryMessageReceived,
  }) {
    return connected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FluidFrontendStreamEvent_InitiatingConnection value)?
        initiatingConnection,
    TResult? Function(FluidFrontendStreamEvent_Connected value)? connected,
    TResult? Function(FluidFrontendStreamEvent_Error value)? error,
    TResult? Function(FluidFrontendStreamEvent_StreamingMessageReceived value)?
        streamingMessageReceived,
    TResult? Function(FluidFrontendStreamEvent_UnaryMessageReceived value)?
        unaryMessageReceived,
  }) {
    return connected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FluidFrontendStreamEvent_InitiatingConnection value)?
        initiatingConnection,
    TResult Function(FluidFrontendStreamEvent_Connected value)? connected,
    TResult Function(FluidFrontendStreamEvent_Error value)? error,
    TResult Function(FluidFrontendStreamEvent_StreamingMessageReceived value)?
        streamingMessageReceived,
    TResult Function(FluidFrontendStreamEvent_UnaryMessageReceived value)?
        unaryMessageReceived,
    required TResult orElse(),
  }) {
    if (connected != null) {
      return connected(this);
    }
    return orElse();
  }
}

abstract class FluidFrontendStreamEvent_Connected
    extends FluidFrontendStreamEvent {
  const factory FluidFrontendStreamEvent_Connected(final DateTime field0) =
      _$FluidFrontendStreamEvent_ConnectedImpl;
  const FluidFrontendStreamEvent_Connected._() : super._();

  DateTime get field0;

  /// Create a copy of FluidFrontendStreamEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FluidFrontendStreamEvent_ConnectedImplCopyWith<
          _$FluidFrontendStreamEvent_ConnectedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FluidFrontendStreamEvent_ErrorImplCopyWith<$Res> {
  factory _$$FluidFrontendStreamEvent_ErrorImplCopyWith(
          _$FluidFrontendStreamEvent_ErrorImpl value,
          $Res Function(_$FluidFrontendStreamEvent_ErrorImpl) then) =
      __$$FluidFrontendStreamEvent_ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({FluidError field0});
}

/// @nodoc
class __$$FluidFrontendStreamEvent_ErrorImplCopyWithImpl<$Res>
    extends _$FluidFrontendStreamEventCopyWithImpl<$Res,
        _$FluidFrontendStreamEvent_ErrorImpl>
    implements _$$FluidFrontendStreamEvent_ErrorImplCopyWith<$Res> {
  __$$FluidFrontendStreamEvent_ErrorImplCopyWithImpl(
      _$FluidFrontendStreamEvent_ErrorImpl _value,
      $Res Function(_$FluidFrontendStreamEvent_ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of FluidFrontendStreamEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$FluidFrontendStreamEvent_ErrorImpl(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as FluidError,
    ));
  }
}

/// @nodoc

class _$FluidFrontendStreamEvent_ErrorImpl
    extends FluidFrontendStreamEvent_Error {
  const _$FluidFrontendStreamEvent_ErrorImpl(this.field0) : super._();

  @override
  final FluidError field0;

  @override
  String toString() {
    return 'FluidFrontendStreamEvent.error(field0: $field0)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FluidFrontendStreamEvent_ErrorImpl &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  /// Create a copy of FluidFrontendStreamEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FluidFrontendStreamEvent_ErrorImplCopyWith<
          _$FluidFrontendStreamEvent_ErrorImpl>
      get copyWith => __$$FluidFrontendStreamEvent_ErrorImplCopyWithImpl<
          _$FluidFrontendStreamEvent_ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime field0) initiatingConnection,
    required TResult Function(DateTime field0) connected,
    required TResult Function(FluidError field0) error,
    required TResult Function(FluidMessageReceived message)
        streamingMessageReceived,
    required TResult Function(FluidMessageReceived message)
        unaryMessageReceived,
  }) {
    return error(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime field0)? initiatingConnection,
    TResult? Function(DateTime field0)? connected,
    TResult? Function(FluidError field0)? error,
    TResult? Function(FluidMessageReceived message)? streamingMessageReceived,
    TResult? Function(FluidMessageReceived message)? unaryMessageReceived,
  }) {
    return error?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime field0)? initiatingConnection,
    TResult Function(DateTime field0)? connected,
    TResult Function(FluidError field0)? error,
    TResult Function(FluidMessageReceived message)? streamingMessageReceived,
    TResult Function(FluidMessageReceived message)? unaryMessageReceived,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(
            FluidFrontendStreamEvent_InitiatingConnection value)
        initiatingConnection,
    required TResult Function(FluidFrontendStreamEvent_Connected value)
        connected,
    required TResult Function(FluidFrontendStreamEvent_Error value) error,
    required TResult Function(
            FluidFrontendStreamEvent_StreamingMessageReceived value)
        streamingMessageReceived,
    required TResult Function(
            FluidFrontendStreamEvent_UnaryMessageReceived value)
        unaryMessageReceived,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FluidFrontendStreamEvent_InitiatingConnection value)?
        initiatingConnection,
    TResult? Function(FluidFrontendStreamEvent_Connected value)? connected,
    TResult? Function(FluidFrontendStreamEvent_Error value)? error,
    TResult? Function(FluidFrontendStreamEvent_StreamingMessageReceived value)?
        streamingMessageReceived,
    TResult? Function(FluidFrontendStreamEvent_UnaryMessageReceived value)?
        unaryMessageReceived,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FluidFrontendStreamEvent_InitiatingConnection value)?
        initiatingConnection,
    TResult Function(FluidFrontendStreamEvent_Connected value)? connected,
    TResult Function(FluidFrontendStreamEvent_Error value)? error,
    TResult Function(FluidFrontendStreamEvent_StreamingMessageReceived value)?
        streamingMessageReceived,
    TResult Function(FluidFrontendStreamEvent_UnaryMessageReceived value)?
        unaryMessageReceived,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class FluidFrontendStreamEvent_Error extends FluidFrontendStreamEvent {
  const factory FluidFrontendStreamEvent_Error(final FluidError field0) =
      _$FluidFrontendStreamEvent_ErrorImpl;
  const FluidFrontendStreamEvent_Error._() : super._();

  FluidError get field0;

  /// Create a copy of FluidFrontendStreamEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FluidFrontendStreamEvent_ErrorImplCopyWith<
          _$FluidFrontendStreamEvent_ErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FluidFrontendStreamEvent_StreamingMessageReceivedImplCopyWith<
    $Res> {
  factory _$$FluidFrontendStreamEvent_StreamingMessageReceivedImplCopyWith(
          _$FluidFrontendStreamEvent_StreamingMessageReceivedImpl value,
          $Res Function(_$FluidFrontendStreamEvent_StreamingMessageReceivedImpl)
              then) =
      __$$FluidFrontendStreamEvent_StreamingMessageReceivedImplCopyWithImpl<
          $Res>;
  @useResult
  $Res call({FluidMessageReceived message});
}

/// @nodoc
class __$$FluidFrontendStreamEvent_StreamingMessageReceivedImplCopyWithImpl<
        $Res>
    extends _$FluidFrontendStreamEventCopyWithImpl<$Res,
        _$FluidFrontendStreamEvent_StreamingMessageReceivedImpl>
    implements
        _$$FluidFrontendStreamEvent_StreamingMessageReceivedImplCopyWith<$Res> {
  __$$FluidFrontendStreamEvent_StreamingMessageReceivedImplCopyWithImpl(
      _$FluidFrontendStreamEvent_StreamingMessageReceivedImpl _value,
      $Res Function(_$FluidFrontendStreamEvent_StreamingMessageReceivedImpl)
          _then)
      : super(_value, _then);

  /// Create a copy of FluidFrontendStreamEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$FluidFrontendStreamEvent_StreamingMessageReceivedImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as FluidMessageReceived,
    ));
  }
}

/// @nodoc

class _$FluidFrontendStreamEvent_StreamingMessageReceivedImpl
    extends FluidFrontendStreamEvent_StreamingMessageReceived {
  const _$FluidFrontendStreamEvent_StreamingMessageReceivedImpl(
      {required this.message})
      : super._();

  @override
  final FluidMessageReceived message;

  @override
  String toString() {
    return 'FluidFrontendStreamEvent.streamingMessageReceived(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FluidFrontendStreamEvent_StreamingMessageReceivedImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of FluidFrontendStreamEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FluidFrontendStreamEvent_StreamingMessageReceivedImplCopyWith<
          _$FluidFrontendStreamEvent_StreamingMessageReceivedImpl>
      get copyWith =>
          __$$FluidFrontendStreamEvent_StreamingMessageReceivedImplCopyWithImpl<
                  _$FluidFrontendStreamEvent_StreamingMessageReceivedImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime field0) initiatingConnection,
    required TResult Function(DateTime field0) connected,
    required TResult Function(FluidError field0) error,
    required TResult Function(FluidMessageReceived message)
        streamingMessageReceived,
    required TResult Function(FluidMessageReceived message)
        unaryMessageReceived,
  }) {
    return streamingMessageReceived(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime field0)? initiatingConnection,
    TResult? Function(DateTime field0)? connected,
    TResult? Function(FluidError field0)? error,
    TResult? Function(FluidMessageReceived message)? streamingMessageReceived,
    TResult? Function(FluidMessageReceived message)? unaryMessageReceived,
  }) {
    return streamingMessageReceived?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime field0)? initiatingConnection,
    TResult Function(DateTime field0)? connected,
    TResult Function(FluidError field0)? error,
    TResult Function(FluidMessageReceived message)? streamingMessageReceived,
    TResult Function(FluidMessageReceived message)? unaryMessageReceived,
    required TResult orElse(),
  }) {
    if (streamingMessageReceived != null) {
      return streamingMessageReceived(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(
            FluidFrontendStreamEvent_InitiatingConnection value)
        initiatingConnection,
    required TResult Function(FluidFrontendStreamEvent_Connected value)
        connected,
    required TResult Function(FluidFrontendStreamEvent_Error value) error,
    required TResult Function(
            FluidFrontendStreamEvent_StreamingMessageReceived value)
        streamingMessageReceived,
    required TResult Function(
            FluidFrontendStreamEvent_UnaryMessageReceived value)
        unaryMessageReceived,
  }) {
    return streamingMessageReceived(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FluidFrontendStreamEvent_InitiatingConnection value)?
        initiatingConnection,
    TResult? Function(FluidFrontendStreamEvent_Connected value)? connected,
    TResult? Function(FluidFrontendStreamEvent_Error value)? error,
    TResult? Function(FluidFrontendStreamEvent_StreamingMessageReceived value)?
        streamingMessageReceived,
    TResult? Function(FluidFrontendStreamEvent_UnaryMessageReceived value)?
        unaryMessageReceived,
  }) {
    return streamingMessageReceived?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FluidFrontendStreamEvent_InitiatingConnection value)?
        initiatingConnection,
    TResult Function(FluidFrontendStreamEvent_Connected value)? connected,
    TResult Function(FluidFrontendStreamEvent_Error value)? error,
    TResult Function(FluidFrontendStreamEvent_StreamingMessageReceived value)?
        streamingMessageReceived,
    TResult Function(FluidFrontendStreamEvent_UnaryMessageReceived value)?
        unaryMessageReceived,
    required TResult orElse(),
  }) {
    if (streamingMessageReceived != null) {
      return streamingMessageReceived(this);
    }
    return orElse();
  }
}

abstract class FluidFrontendStreamEvent_StreamingMessageReceived
    extends FluidFrontendStreamEvent {
  const factory FluidFrontendStreamEvent_StreamingMessageReceived(
          {required final FluidMessageReceived message}) =
      _$FluidFrontendStreamEvent_StreamingMessageReceivedImpl;
  const FluidFrontendStreamEvent_StreamingMessageReceived._() : super._();

  FluidMessageReceived get message;

  /// Create a copy of FluidFrontendStreamEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FluidFrontendStreamEvent_StreamingMessageReceivedImplCopyWith<
          _$FluidFrontendStreamEvent_StreamingMessageReceivedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FluidFrontendStreamEvent_UnaryMessageReceivedImplCopyWith<
    $Res> {
  factory _$$FluidFrontendStreamEvent_UnaryMessageReceivedImplCopyWith(
          _$FluidFrontendStreamEvent_UnaryMessageReceivedImpl value,
          $Res Function(_$FluidFrontendStreamEvent_UnaryMessageReceivedImpl)
              then) =
      __$$FluidFrontendStreamEvent_UnaryMessageReceivedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({FluidMessageReceived message});
}

/// @nodoc
class __$$FluidFrontendStreamEvent_UnaryMessageReceivedImplCopyWithImpl<$Res>
    extends _$FluidFrontendStreamEventCopyWithImpl<$Res,
        _$FluidFrontendStreamEvent_UnaryMessageReceivedImpl>
    implements
        _$$FluidFrontendStreamEvent_UnaryMessageReceivedImplCopyWith<$Res> {
  __$$FluidFrontendStreamEvent_UnaryMessageReceivedImplCopyWithImpl(
      _$FluidFrontendStreamEvent_UnaryMessageReceivedImpl _value,
      $Res Function(_$FluidFrontendStreamEvent_UnaryMessageReceivedImpl) _then)
      : super(_value, _then);

  /// Create a copy of FluidFrontendStreamEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$FluidFrontendStreamEvent_UnaryMessageReceivedImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as FluidMessageReceived,
    ));
  }
}

/// @nodoc

class _$FluidFrontendStreamEvent_UnaryMessageReceivedImpl
    extends FluidFrontendStreamEvent_UnaryMessageReceived {
  const _$FluidFrontendStreamEvent_UnaryMessageReceivedImpl(
      {required this.message})
      : super._();

  @override
  final FluidMessageReceived message;

  @override
  String toString() {
    return 'FluidFrontendStreamEvent.unaryMessageReceived(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FluidFrontendStreamEvent_UnaryMessageReceivedImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of FluidFrontendStreamEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FluidFrontendStreamEvent_UnaryMessageReceivedImplCopyWith<
          _$FluidFrontendStreamEvent_UnaryMessageReceivedImpl>
      get copyWith =>
          __$$FluidFrontendStreamEvent_UnaryMessageReceivedImplCopyWithImpl<
                  _$FluidFrontendStreamEvent_UnaryMessageReceivedImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime field0) initiatingConnection,
    required TResult Function(DateTime field0) connected,
    required TResult Function(FluidError field0) error,
    required TResult Function(FluidMessageReceived message)
        streamingMessageReceived,
    required TResult Function(FluidMessageReceived message)
        unaryMessageReceived,
  }) {
    return unaryMessageReceived(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime field0)? initiatingConnection,
    TResult? Function(DateTime field0)? connected,
    TResult? Function(FluidError field0)? error,
    TResult? Function(FluidMessageReceived message)? streamingMessageReceived,
    TResult? Function(FluidMessageReceived message)? unaryMessageReceived,
  }) {
    return unaryMessageReceived?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime field0)? initiatingConnection,
    TResult Function(DateTime field0)? connected,
    TResult Function(FluidError field0)? error,
    TResult Function(FluidMessageReceived message)? streamingMessageReceived,
    TResult Function(FluidMessageReceived message)? unaryMessageReceived,
    required TResult orElse(),
  }) {
    if (unaryMessageReceived != null) {
      return unaryMessageReceived(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(
            FluidFrontendStreamEvent_InitiatingConnection value)
        initiatingConnection,
    required TResult Function(FluidFrontendStreamEvent_Connected value)
        connected,
    required TResult Function(FluidFrontendStreamEvent_Error value) error,
    required TResult Function(
            FluidFrontendStreamEvent_StreamingMessageReceived value)
        streamingMessageReceived,
    required TResult Function(
            FluidFrontendStreamEvent_UnaryMessageReceived value)
        unaryMessageReceived,
  }) {
    return unaryMessageReceived(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FluidFrontendStreamEvent_InitiatingConnection value)?
        initiatingConnection,
    TResult? Function(FluidFrontendStreamEvent_Connected value)? connected,
    TResult? Function(FluidFrontendStreamEvent_Error value)? error,
    TResult? Function(FluidFrontendStreamEvent_StreamingMessageReceived value)?
        streamingMessageReceived,
    TResult? Function(FluidFrontendStreamEvent_UnaryMessageReceived value)?
        unaryMessageReceived,
  }) {
    return unaryMessageReceived?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FluidFrontendStreamEvent_InitiatingConnection value)?
        initiatingConnection,
    TResult Function(FluidFrontendStreamEvent_Connected value)? connected,
    TResult Function(FluidFrontendStreamEvent_Error value)? error,
    TResult Function(FluidFrontendStreamEvent_StreamingMessageReceived value)?
        streamingMessageReceived,
    TResult Function(FluidFrontendStreamEvent_UnaryMessageReceived value)?
        unaryMessageReceived,
    required TResult orElse(),
  }) {
    if (unaryMessageReceived != null) {
      return unaryMessageReceived(this);
    }
    return orElse();
  }
}

abstract class FluidFrontendStreamEvent_UnaryMessageReceived
    extends FluidFrontendStreamEvent {
  const factory FluidFrontendStreamEvent_UnaryMessageReceived(
          {required final FluidMessageReceived message}) =
      _$FluidFrontendStreamEvent_UnaryMessageReceivedImpl;
  const FluidFrontendStreamEvent_UnaryMessageReceived._() : super._();

  FluidMessageReceived get message;

  /// Create a copy of FluidFrontendStreamEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FluidFrontendStreamEvent_UnaryMessageReceivedImplCopyWith<
          _$FluidFrontendStreamEvent_UnaryMessageReceivedImpl>
      get copyWith => throw _privateConstructorUsedError;
}
