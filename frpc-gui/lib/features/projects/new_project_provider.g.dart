// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_project_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$newProjectHash() => r'e6258b2a5bdd8dcdd368a8e654eda9b1593c091b';

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

abstract class _$NewProject
    extends BuildlessAutoDisposeNotifier<NewProjectState> {
  late final String id;

  NewProjectState build(
    String id,
  );
}

/// Provider for the [NewProjectState] for creating a new project.
///
/// Copied from [NewProject].
@ProviderFor(NewProject)
const newProjectProvider = NewProjectFamily();

/// Provider for the [NewProjectState] for creating a new project.
///
/// Copied from [NewProject].
class NewProjectFamily extends Family<NewProjectState> {
  /// Provider for the [NewProjectState] for creating a new project.
  ///
  /// Copied from [NewProject].
  const NewProjectFamily();

  /// Provider for the [NewProjectState] for creating a new project.
  ///
  /// Copied from [NewProject].
  NewProjectProvider call(
    String id,
  ) {
    return NewProjectProvider(
      id,
    );
  }

  @override
  NewProjectProvider getProviderOverride(
    covariant NewProjectProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'newProjectProvider';
}

/// Provider for the [NewProjectState] for creating a new project.
///
/// Copied from [NewProject].
class NewProjectProvider
    extends AutoDisposeNotifierProviderImpl<NewProject, NewProjectState> {
  /// Provider for the [NewProjectState] for creating a new project.
  ///
  /// Copied from [NewProject].
  NewProjectProvider(
    String id,
  ) : this._internal(
          () => NewProject()..id = id,
          from: newProjectProvider,
          name: r'newProjectProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$newProjectHash,
          dependencies: NewProjectFamily._dependencies,
          allTransitiveDependencies:
              NewProjectFamily._allTransitiveDependencies,
          id: id,
        );

  NewProjectProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  NewProjectState runNotifierBuild(
    covariant NewProject notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(NewProject Function() create) {
    return ProviderOverride(
      origin: this,
      override: NewProjectProvider._internal(
        () => create()..id = id,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<NewProject, NewProjectState>
      createElement() {
    return _NewProjectProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NewProjectProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin NewProjectRef on AutoDisposeNotifierProviderRef<NewProjectState> {
  /// The parameter `id` of this provider.
  String get id;
}

class _NewProjectProviderElement
    extends AutoDisposeNotifierProviderElement<NewProject, NewProjectState>
    with NewProjectRef {
  _NewProjectProviderElement(super.provider);

  @override
  String get id => (origin as NewProjectProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
