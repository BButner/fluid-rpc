// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$projectStateHash() => r'2172e6cbd5831e13ebe79da3b40cfade608ba9f6';

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

abstract class _$ProjectState
    extends BuildlessAutoDisposeAsyncNotifier<ActiveProjectState> {
  late final String projectId;

  FutureOr<ActiveProjectState> build(
    String projectId,
  );
}

/// Provider for the state related to a project.
///
/// Copied from [ProjectState].
@ProviderFor(ProjectState)
const projectStateProvider = ProjectStateFamily();

/// Provider for the state related to a project.
///
/// Copied from [ProjectState].
class ProjectStateFamily extends Family<AsyncValue<ActiveProjectState>> {
  /// Provider for the state related to a project.
  ///
  /// Copied from [ProjectState].
  const ProjectStateFamily();

  /// Provider for the state related to a project.
  ///
  /// Copied from [ProjectState].
  ProjectStateProvider call(
    String projectId,
  ) {
    return ProjectStateProvider(
      projectId,
    );
  }

  @override
  ProjectStateProvider getProviderOverride(
    covariant ProjectStateProvider provider,
  ) {
    return call(
      provider.projectId,
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
  String? get name => r'projectStateProvider';
}

/// Provider for the state related to a project.
///
/// Copied from [ProjectState].
class ProjectStateProvider extends AutoDisposeAsyncNotifierProviderImpl<
    ProjectState, ActiveProjectState> {
  /// Provider for the state related to a project.
  ///
  /// Copied from [ProjectState].
  ProjectStateProvider(
    String projectId,
  ) : this._internal(
          () => ProjectState()..projectId = projectId,
          from: projectStateProvider,
          name: r'projectStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$projectStateHash,
          dependencies: ProjectStateFamily._dependencies,
          allTransitiveDependencies:
              ProjectStateFamily._allTransitiveDependencies,
          projectId: projectId,
        );

  ProjectStateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.projectId,
  }) : super.internal();

  final String projectId;

  @override
  FutureOr<ActiveProjectState> runNotifierBuild(
    covariant ProjectState notifier,
  ) {
    return notifier.build(
      projectId,
    );
  }

  @override
  Override overrideWith(ProjectState Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProjectStateProvider._internal(
        () => create()..projectId = projectId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        projectId: projectId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ProjectState, ActiveProjectState>
      createElement() {
    return _ProjectStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProjectStateProvider && other.projectId == projectId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, projectId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ProjectStateRef
    on AutoDisposeAsyncNotifierProviderRef<ActiveProjectState> {
  /// The parameter `projectId` of this provider.
  String get projectId;
}

class _ProjectStateProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ProjectState,
        ActiveProjectState> with ProjectStateRef {
  _ProjectStateProviderElement(super.provider);

  @override
  String get projectId => (origin as ProjectStateProvider).projectId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
