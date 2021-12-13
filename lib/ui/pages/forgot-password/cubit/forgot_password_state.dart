part of 'forgot_password_cubit.dart';

class ForgotPasswordState extends Equatable {
  const ForgotPasswordState({
    this.asyncChangePassword = const AsyncState.uninitialized(),
    this.email = const Tuple2(null, false),
    this.oldPassword = const Tuple2(null, false),
    this.newPassword = const Tuple2(null, false),
    this.isOldPasswordVisible = false,
    this.isNewPasswordVisible = false,
  });

  final AsyncState<bool> asyncChangePassword;
  final FieldValidation email;
  final FieldValidation oldPassword;
  final FieldValidation newPassword;
  final bool isOldPasswordVisible;
  final bool isNewPasswordVisible;

  ForgotPasswordState copyWith({
    AsyncState<bool>? asyncChangePassword,
    FieldValidation? email,
    FieldValidation? oldPassword,
    FieldValidation? newPassword,
    bool? isOldPasswordVisible,
    bool? isNewPasswordVisible,
  }) {
    return ForgotPasswordState(
      asyncChangePassword: asyncChangePassword ?? this.asyncChangePassword,
      email: email ?? this.email,
      oldPassword: oldPassword ?? this.oldPassword,
      newPassword: newPassword ?? this.newPassword,
      isNewPasswordVisible: isNewPasswordVisible ?? this.isNewPasswordVisible,
      isOldPasswordVisible: isOldPasswordVisible ?? this.isOldPasswordVisible,
    );
  }

  @override
  List<Object> get props => [
        email,
        oldPassword,
        newPassword,
        isNewPasswordVisible,
        isOldPasswordVisible,
        asyncChangePassword,
      ];
}
