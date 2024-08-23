// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_tab_controller_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$projectTabControllerHash() =>
    r'89f761f5be5ccd142945c90a15692b354225a5f2';

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

abstract class _$ProjectTabController
    extends BuildlessAutoDisposeNotifier<ProjectTabState> {
  late final String projectId;

  ProjectTabState build(
    String projectId,
  );
}

/// See also [ProjectTabController].
@ProviderFor(ProjectTabController)
const projectTabControllerProvider = ProjectTabControllerFamily();

/// See also [ProjectTabController].
class ProjectTabControllerFamily extends Family<ProjectTabState> {
  /// See also [ProjectTabController].
  const ProjectTabControllerFamily();

  /// See also [ProjectTabController].
  ProjectTabControllerProvider call(
    String projectId,
  ) {
    return ProjectTabControllerProvider(
      projectId,
    );
  }

  @override
  ProjectTabControllerProvider getProviderOverride(
    covariant ProjectTabControllerProvider provider,
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
  String? get name => r'projectTabControllerProvider';
}

/// See also [ProjectTabController].
class ProjectTabControllerProvider extends AutoDisposeNotifierProviderImpl<
    ProjectTabController, ProjectTabState> {
  /// See also [ProjectTabController].
  ProjectTabControllerProvider(
    String projectId,
  ) : this._internal(
          () => ProjectTabController()..projectId = projectId,
          from: projectTabControllerProvider,
          name: r'projectTabControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$projectTabControllerHash,
          dependencies: ProjectTabControllerFamily._dependencies,
          allTransitiveDependencies:
              ProjectTabControllerFamily._allTransitiveDependencies,
          projectId: projectId,
        );

  ProjectTabControllerProvider._internal(
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
  ProjectTabState runNotifierBuild(
    covariant ProjectTabController notifier,
  ) {
    return notifier.build(
      projectId,
    );
  }

  @override
  Override overrideWith(ProjectTabController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProjectTabControllerProvider._internal(
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
  AutoDisposeNotifierProviderElement<ProjectTabController, ProjectTabState>
      createElement() {
    return _ProjectTabControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProjectTabControllerProvider &&
        other.projectId == projectId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, projectId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ProjectTabControllerRef
    on AutoDisposeNotifierProviderRef<ProjectTabState> {
  /// The parameter `projectId` of this provider.
  String get projectId;
}

class _ProjectTabControllerProviderElement
    extends AutoDisposeNotifierProviderElement<ProjectTabController,
        ProjectTabState> with ProjectTabControllerRef {
  _ProjectTabControllerProviderElement(super.provider);

  @override
  String get projectId => (origin as ProjectTabControllerProvider).projectId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
