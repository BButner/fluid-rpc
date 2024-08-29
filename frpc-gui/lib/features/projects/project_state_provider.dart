import 'package:frpc_gui/features/projects/projects_provider.dart';
import 'package:frpc_gui/src/rust/api/models/descriptors/server_descriptor.dart';
import 'package:frpc_gui/src/rust/api/models/environment/environment.dart';
import 'package:frpc_gui/src/rust/api/models/project/project.dart';
import 'package:frpc_gui/src/rust/api/simple.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'project_state_provider.g.dart';

/// Provides the state for an active project.
class ActiveProjectState {
  /// Creates a new [ActiveProjectState].
  ActiveProjectState({
    required this.project,
    required this.projectDirectoryPath,
    required this.selectedEnvironment,
    required this.serverDescriptor,
  });

  /// The instance of the [Project].
  final Project project;

  /// The path to the [Project] directory.
  final String projectDirectoryPath;

  /// The currently selected [Environment].
  final Environment? selectedEnvironment;

  /// The current [ServerDescriptor] data.
  final ServerDescriptor? serverDescriptor;

  /// Copy with.
  ActiveProjectState copyWith({
    ServerDescriptor? serverDescriptor,
    Environment? selectedEnvironment,
  }) =>
      ActiveProjectState(
        project: project,
        projectDirectoryPath: projectDirectoryPath,
        selectedEnvironment: selectedEnvironment ?? this.selectedEnvironment,
        serverDescriptor: serverDescriptor ?? this.serverDescriptor,
      );
}

/// Provider for the state related to a project.
@riverpod
class ProjectState extends _$ProjectState {
  @override
  Future<ActiveProjectState> build(String projectId) async {
    final loadedProjects = await ref.watch(projectsProvider.future);

    final project =
        loadedProjects.firstWhere((lp) => lp.project.id == projectId);

    final initialEnvironment = project.project.environments.firstOrNull;

    ServerDescriptor? desc;

    if (initialEnvironment != null &&
        project.project.loaderType is ProjectLoader_ServerReflection) {
      // TODO(bbutner): This needs to be improved to build the string based on the connection.
      final con = initialEnvironment.connection;
      desc = await testGetServerDescriptor(
        serverUrl: 'http://${con.host}:${con.port}',
      );
    }

    return ActiveProjectState(
      project: project.project,
      projectDirectoryPath: project.projectDirectoryPath,
      selectedEnvironment: initialEnvironment,
      serverDescriptor: desc,
    );
  }

  /// Refreshes the currently imported data.
  Future<void> refreshImportData() async {
    // TODO(bbutner): We NEED a better way to build a connection, this
    // should probably be centralized, AND we need to remove any methods
    // from the tabs that are no longer valid...
    final curState = state.value!;

    if (curState.selectedEnvironment == null ||
        curState.project.loaderType is! ProjectLoader_ServerReflection) {
      return;
    }

    final con = curState.selectedEnvironment!.connection;
    final desc = await testGetServerDescriptor(
      serverUrl: 'http://${con.host}:${con.port}',
    );

    state = AsyncValue.data(
      state.value!.copyWith(
        serverDescriptor: desc,
      ),
    );
  }

  /// Adds a new environment.
  Future<void> addEnvironment(Environment newEnv) async {
    final currentState = state.value!;
    currentState.project.environments.add(newEnv);

    await currentState.project.save(
      projectDirectoryPath: currentState.projectDirectoryPath,
    );

    state = AsyncValue.data(currentState);
  }

  /// Selects an existing environment by id.
  void selectEnvironment(String id) {
    state = AsyncValue.data(
      state.value!.copyWith(
        selectedEnvironment:
            state.value!.project.environments.firstWhere((env) => env.id == id),
      ),
    );
  }
}
