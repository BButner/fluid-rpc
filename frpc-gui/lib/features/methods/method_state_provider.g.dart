// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'method_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$methodStateHash() => r'08d09004fe6ed3509fb6928eeb97ec9cdeac5752';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$MethodState
    extends BuildlessAutoDisposeNotifier<MethodBuilderState> {
  late final String methodTarget;

  MethodBuilderState build(
    String methodTarget,
  );
}

/// Provider for the current method builder state.
///
/// Copied from [MethodState].
@ProviderFor(MethodState)
const methodStateProvider = MethodStateFamily();

/// Provider for the current method builder state.
///
/// Copied from [MethodState].
class MethodStateFamily extends Family<MethodBuilderState> {
  /// Provider for the current method builder state.
  ///
  /// Copied from [MethodState].
  const MethodStateFamily();

  /// Provider for the current method builder state.
  ///
  /// Copied from [MethodState].
  MethodStateProvider call(
    String methodTarget,
  ) {
    return MethodStateProvider(
      methodTarget,
    );
  }

  @override
  MethodStateProvider getProviderOverride(
    covariant MethodStateProvider provider,
  ) {
    return call(
      provider.methodTarget,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'methodStateProvider';
}

/// Provider for the current method builder state.
///
/// Copied from [MethodState].
class MethodStateProvider
    extends AutoDisposeNotifierProviderImpl<MethodState, MethodBuilderState> {
  /// Provider for the current method builder state.
  ///
  /// Copied from [MethodState].
  MethodStateProvider(
    String methodTarget,
  ) : this._internal(
          () => MethodState()..methodTarget = methodTarget,
          from: methodStateProvider,
          name: r'methodStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$methodStateHash,
          dependencies: MethodStateFamily._dependencies,
          allTransitiveDependencies:
              MethodStateFamily._allTransitiveDependencies,
          methodTarget: methodTarget,
        );

  MethodStateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.methodTarget,
  }) : super.internal();

  final String methodTarget;

  @override
  MethodBuilderState runNotifierBuild(
    covariant MethodState notifier,
  ) {
    return notifier.build(
      methodTarget,
    );
  }

  @override
  Override overrideWith(MethodState Function() create) {
    return ProviderOverride(
      origin: this,
      override: MethodStateProvider._internal(
        () => create()..methodTarget = methodTarget,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        methodTarget: methodTarget,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<MethodState, MethodBuilderState>
      createElement() {
    return _MethodStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MethodStateProvider && other.methodTarget == methodTarget;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, methodTarget.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MethodStateRef on AutoDisposeNotifierProviderRef<MethodBuilderState> {
  /// The parameter `methodTarget` of this provider.
  String get methodTarget;
}

class _MethodStateProviderElement
    extends AutoDisposeNotifierProviderElement<MethodState, MethodBuilderState>
    with MethodStateRef {
  _MethodStateProviderElement(super.provider);

  @override
  String get methodTarget => (origin as MethodStateProvider).methodTarget;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
