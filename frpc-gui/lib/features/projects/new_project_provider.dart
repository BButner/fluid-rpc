import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'new_project_provider.g.dart';

/// Enum for the selected loader type when creating a new project.
enum SelectedLoaderType {
  /// Load the gRPC info over server reflection.
  reflection,

  /// Load the gRPC info via proto glob paths.
  protoImport;
}

/// Class that holds the state of the new project.
class NewProjectState {
  /// Creates a new [NewProjectState].
  const NewProjectState({
    required this.id,
    required this.displayName,
    required this.projectDirectory,
    required this.loaderType,
  });

  /// The id of the new project.
  final String id;

  /// The display name of the project.
  final String displayName;

  /// The directory of the project.
  final String projectDirectory;

  /// The currently selected [SelectedLoaderType].
  final SelectedLoaderType loaderType;

  /// Copy with.
  NewProjectState copyWith({
    String? displayName,
    String? projectDirectory,
    SelectedLoaderType? loaderType,
  }) =>
      NewProjectState(
        id: id,
        displayName: displayName ?? this.displayName,
        projectDirectory: projectDirectory ?? this.projectDirectory,
        loaderType: loaderType ?? this.loaderType,
      );
}

/// Provider for the [NewProjectState] for creating a new project.
@riverpod
class NewProject extends _$NewProject {
  @override
  NewProjectState build(
    String id,
  ) =>
      NewProjectState(
        id: id,
        displayName: '',
        projectDirectory: '',
        loaderType: SelectedLoaderType.values.first,
      );

  /// Updates the display name.
  void updateDisplayName(String displayName) =>
      state = state.copyWith(displayName: displayName);

  /// Updates the project directory.
  void updateProjectDirectory(String projDir) =>
      state = state.copyWith(projectDirectory: projDir);

  /// Updates the loader type.
  void updateLoaderType(SelectedLoaderType loaderType) =>
      state = state.copyWith(loaderType: loaderType);
}
