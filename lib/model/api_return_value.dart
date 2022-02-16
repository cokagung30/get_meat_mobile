part of 'models.dart';

class ApiReturnValue<T> {
  final T? value;
  final String? message;
  final bool isSuccess;
  final bool? isAuth;

  const ApiReturnValue({
    this.value,
    this.message,
    this.isSuccess = false,
    this.isAuth = true,
  });
}
