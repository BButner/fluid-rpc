import 'package:frpc_gui/features/projects/project_state_provider.dart';
import 'package:frpc_gui/src/rust/api/models/stream_event.dart';
import 'package:frpc_gui/src/rust/api/simple.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'method_state_provider.g.dart';

/// The state of a method builder.
class MethodBuilderState {
  /// Creates a new [MethodBuilderState].
  MethodBuilderState({
    required this.target,
    required this.requestData,
    required this.responses,
  });

  /// The target string of this method.
  final String target;

  /// The current JSON data that will be passed to the request.
  final String requestData;

  /// The list of [FluidFrontendStreamEvent] received from the invocation.
  final List<FluidFrontendStreamEvent> responses;

  /// Copy with.
  MethodBuilderState copyWith({
    String? requestData,
    List<FluidFrontendStreamEvent>? responses,
  }) =>
      MethodBuilderState(
        target: target,
        requestData: requestData ?? this.requestData,
        responses: responses ?? this.responses,
      );
}

/// Provider for the current method builder state.
@riverpod
class MethodState extends _$MethodState {
  @override
  MethodBuilderState build(
    String methodTarget,
  ) =>
      MethodBuilderState(
        target: methodTarget,
        requestData: '{}',
        responses: [],
      );

  /// Updates the current value of the request data.
  void updateRequestData(String data) => state = state.copyWith(
        requestData: data,
      );

  /// Invokes the method.
  Future<void> invoke(
    String projectId,
  ) async {
    final projectState =
        await ref.read(projectStateProvider.call(projectId).future);

    if (projectState.serverDescriptor == null ||
        projectState.selectedEnvironment == null) {
      return;
    }

    final con = projectState.selectedEnvironment!.connection;

    final url = 'http://${con.host}:${con.port}';

    final cancel = await CancelableExecution.newInstance();

    await for (final res in testInvokeWithPool(
      desc: projectState.serverDescriptor!,
      serverUrl: url,
      target: state.target,
      data: state.requestData,
      cancelExec: cancel,
    )) {
      state = state.copyWith(
        responses: [
          ...state.responses,
          res,
        ],
      );
    }
  }
}
