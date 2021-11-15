part of 'sign_in_cubit.dart';

@immutable
class SignInState extends Equatable {
  const SignInState({
    this.email = const Tuple2(null, false),
    this.password = const Tuple2(null, false),
    this.isPasswordVisible = false,
    this.validated = false,
    this.asyncUserLogged = const AsyncState.uninitialized(),
  });

  final FieldValidation email;
  final FieldValidation password;
  final bool isPasswordVisible;
  final bool validated;
  final AsyncState<ApiReturnValue<User>> asyncUserLogged;

  SignInState copyWith({
    FieldValidation? email,
    FieldValidation? password,
    bool? isPasswordVisible,
    bool? validated,
    AsyncState<ApiReturnValue<User>>? asyncUserLogged,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      validated: validated ?? this.validated,
      asyncUserLogged: asyncUserLogged ?? this.asyncUserLogged,
    );
  }

  @override
  List<Object?> get props =>
      [email, password, isPasswordVisible, validated, asyncUserLogged];
}
