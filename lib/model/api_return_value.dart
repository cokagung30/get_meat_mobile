part of 'models.dart';

class ApiReturnValue<T> {
  final T? value;
  final String? message;

  const ApiReturnValue({
    this.value,
    this.message,
  });
}
