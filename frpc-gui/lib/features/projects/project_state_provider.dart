import 'package:frpc_gui/features/projects/projects_provider.dart';
import 'package:frpc_gui/src/rust/api/models/descriptors/method_descriptor.dart';
import 'package:frpc_gui/src/rust/api/models/descriptors/server_descriptor.dart';
import 'package:frpc_gui/src/rust/api/models/descriptors/service_descriptor.dart';
import 'package:frpc_gui/src/rust/api/models/environment/environment.dart';
import 'package:frpc_gui/src/rust/api/models/project/project.dart';
import 'package:frpc_gui/src/rust/api/simple.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'project_state_provider.g.dart';

class ActiveProjectState {
  ActiveProjectState({
    required this.project,
    required this.projectDirectoryPath,
    required this.selectedEnvironment,
    required this.openedMethods,
    required this.serverDescriptor,
  });

  /// The instance of the [Project].
  final Project project;

  /// The path to the [Project] directory.
  final String projectDirectoryPath;

  /// The currently selected [Environment].
  final Environment? selectedEnvironment;

  /// The list of opened [MethodDescriptor]s.
  final List<OpenedMethod> openedMethods;

  /// The current [ServerDescriptor] data.
  final ServerDescriptor? serverDescriptor;

  ActiveProjectState copyWith({
    Environment? selectedEnvironment,
    List<OpenedMethod>? openedMethods,
    ServerDescriptor? serverDescriptor,
  }) =>
      ActiveProjectState(
        project: project,
        projectDirectoryPath: projectDirectoryPath,
        selectedEnvironment: selectedEnvironment ?? this.selectedEnvironment,
        openedMethods: openedMethods ?? this.openedMethods,
        serverDescriptor: serverDescriptor ?? this.serverDescriptor,
      );
}

class OpenedMethod {
  OpenedMethod({
    required this.parentService,
    required this.method,
    required this.server,
  });

  final ServiceDescriptor parentService;
  final MethodDescriptor method;
  final ServerDescriptor server;
}

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
          serverUrl: 'http://${con.host}:${con.port}');
    }

    return ActiveProjectState(
      project: project.project,
      projectDirectoryPath: project.projectDirectoryPath,
      selectedEnvironment: initialEnvironment,
      openedMethods: [],
      serverDescriptor: desc,
    );
  }

  Future<void> addEnvironment(Environment newEnv) async {
    final currentState = state.value!;
    currentState.project.environments.add(newEnv);

    await currentState.project.save(
      projectDirectoryPath: currentState.projectDirectoryPath,
    );

    state = AsyncValue.data(currentState);
  }

  void selectEnvironment(String id) {
    state = AsyncValue.data(state.value!.copyWith(
        selectedEnvironment: state.value!.project.environments
            .firstWhere((env) => env.id == id)));
  }

  void openMethod(
    ServiceDescriptor service,
    MethodDescriptor desc,
    ServerDescriptor server,
  ) {
    final currentState = state.value!;

    state = AsyncValue.data(currentState.copyWith(
      openedMethods: [
        ...currentState.openedMethods,
        OpenedMethod(
          parentService: service,
          method: desc,
          server: server,
        ),
      ],
    ));
  }
}
