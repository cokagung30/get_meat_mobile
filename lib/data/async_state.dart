import 'package:equatable/equatable.dart';

enum AsyncStatus { uninitialized, loading, success, error }

class AsyncState<T> extends Equatable {
  final T? data;
  final Exception? error;
  final AsyncStatus status;

  const AsyncState.uninitialized()
      : status = AsyncStatus.uninitialized,
        error = null,
        data = null;

  const AsyncState.loading()
      : status = AsyncStatus.loading,
        error = null,
        data = null;

  const AsyncState.success(this.data)
      : status = AsyncStatus.success,
        error = null;

  const AsyncState.error(this.error)
      : status = AsyncStatus.error,
        data = null;

  bool get isError => status == AsyncStatus.error;

  bool get isSuccess => status == AsyncStatus.success;

  bool get isLoading => status == AsyncStatus.loading;

  bool get isUninitialized => status == AsyncStatus.uninitialized;

  @override
  List<Object?> get props => [data, status, error];
}
