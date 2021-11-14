part of 'models.dart';

class ApiReturnValue<T> {
  final T? value;
  final String? message;
  final bool? isSuccess;

  const ApiReturnValue({
    this.value,
    this.message,
    this.isSuccess = false,
  });
}
