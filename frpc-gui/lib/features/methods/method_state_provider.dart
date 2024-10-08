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
    required this.startTime,
    required this.lastUpdateTime,
    this.cancellation,
  });

  /// The target string of this method.
  final String target;

  /// The current JSON data that will be passed to the request.
  final String requestData;

  /// The list of [FluidFrontendStreamEvent] received from the invocation.
  final List<FluidFrontendStreamEvent> responses;

  /// The current [CancelableExecution] of the invocation, if we are currently
  /// invoking a method.
  final CancelableExecution? cancellation;

  /// The optional start time for the method invocation.
  final DateTime? startTime;

  /// The last time we got an update from the backend.
  final DateTime? lastUpdateTime;

  /// Copy with.
  MethodBuilderState copyWith({
    required CancelableExecution? cancellation,
    required DateTime? startTime,
    required DateTime? lastUpdateTime,
    String? requestData,
    List<FluidFrontendStreamEvent>? responses,
  }) =>
      MethodBuilderState(
        target: target,
        requestData: requestData ?? this.requestData,
        responses: responses ?? this.responses,
        cancellation: cancellation,
        startTime: startTime,
        lastUpdateTime: lastUpdateTime,
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
        startTime: null,
        lastUpdateTime: null,
      );

  /// Updates the current value of the request data.
  void updateRequestData(String data) => state = state.copyWith(
        cancellation: state.cancellation,
        startTime: state.startTime,
        lastUpdateTime: state.lastUpdateTime,
        requestData: data,
      );

  /// Cancels the current invocation.
  void cancel() async => state.cancellation?.cancel();

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

    state = state.copyWith(
      cancellation: cancel,
      responses: [],
      startTime: DateTime.now(),
      lastUpdateTime: null,
    );

    await for (final res in testInvokeWithPool(
      desc: projectState.serverDescriptor!,
      serverUrl: url,
      target: state.target,
      data: state.requestData,
      cancelExec: cancel,
    )) {
      state = state.copyWith(
        cancellation: state.cancellation,
        startTime: state.startTime,
        lastUpdateTime: DateTime.now(),
        responses: [
          ...state.responses,
          res,
        ],
      );
    }

    state = state.copyWith(
      cancellation: null,
      startTime: state.startTime,
      lastUpdateTime: state.lastUpdateTime,
    );
  }
}
