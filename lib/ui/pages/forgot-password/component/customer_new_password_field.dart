part of '../forgot_password_screen.dart';

typedef ShowNewPasswordCustomerSelector
    = BlocSelector<ForgotPasswordCubit, ForgotPasswordState, bool>;

class _CustomerNewPasswordField extends StatelessWidget {
  const _CustomerNewPasswordField(this.keyField);

  final GlobalKey<FormBuilderFieldState>? keyField;

  @override
  Widget build(BuildContext context) {
    return ShowNewPasswordCustomerSelector(
      selector: (state) => state.isNewPasswordVisible,
      builder: (_, isPasswordVisible) {
        return GetMeatTextInput(
          label: 'Password Baru',
          keyName: 'new_password',
          keyboardType: TextInputType.visiblePassword,
          obscureText: !isPasswordVisible,
          showObscureIcon: true,
          onSuffixIconClick: () {
            context.read<ForgotPasswordCubit>().setNewPasswordVisibility();
          },
          validators: FormBuilderValidators.compose([
            FormBuilderValidators.required(context),
          ]),
          onChanged: (value) {
            context
                .read<ForgotPasswordCubit>()
                .newPasswordChanged(value!, true);
          },
        );
      },
    );
  }
}
