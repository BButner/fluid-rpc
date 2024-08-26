import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'method_state_provider.g.dart';

/// The state of a method builder.
class MethodBuilderState {
  /// Creates a new [MethodBuilderState].
  MethodBuilderState({
    required this.requestData,
  });

  /// The current JSON data that will be passed to the request.
  final String requestData;

  /// Copy with.
  MethodBuilderState copyWith({
    String? requestData,
  }) =>
      MethodBuilderState(
        requestData: requestData ?? this.requestData,
      );
}

/// Provider for the current method builder state.
@riverpod
class MethodState extends _$MethodState {
  @override
  MethodBuilderState build(
    String methodId,
  ) =>
      MethodBuilderState(
        requestData: '',
      );

  /// Updates the current value of the request data.
  void updateRequestData(String data) => state = state.copyWith(
        requestData: data,
      );
}
