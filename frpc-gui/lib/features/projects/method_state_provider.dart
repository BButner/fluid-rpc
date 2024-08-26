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
    required this.responseData,
  });

  /// The target string of this method.
  final String target;

  /// The current JSON data that will be passed to the request.
  final String requestData;

  /// The current JSON response data.
  final String responseData;

  /// Copy with.
  MethodBuilderState copyWith({
    String? requestData,
    String? responseData,
  }) =>
      MethodBuilderState(
        target: target,
        requestData: requestData ?? this.requestData,
        responseData: responseData ?? this.responseData,
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
        requestData: '',
        responseData: '',
      );

  /// Updates the current value of the request data.
  void updateRequestData(String data) => state = state.copyWith(
        requestData: data,
      );

  /// Updates the current value of the response data.
  void updateResponseData(String data) => state = state.copyWith(
        responseData: data,
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
      cancelExec: cancel,
    )) {
      if (res is FluidFrontendStreamEvent_UnaryMessageReceived) {
        state = state.copyWith(
          responseData: res.message.contents,
        );
      }
    }
  }
}
