part of '../forgot_password_screen.dart';

typedef ShowPasswordCustomerSelector
    = BlocSelector<ForgotPasswordCubit, ForgotPasswordState, bool>;

class _CustomerOldPasswordField extends StatelessWidget {
  const _CustomerOldPasswordField(this.keyField);

  final GlobalKey<FormBuilderFieldState>? keyField;

  @override
  Widget build(BuildContext context) {
    return ShowPasswordCustomerSelector(
      selector: (state) => state.isOldPasswordVisible,
      builder: (_, isPasswordVisible) {
        return GetMeatTextInput(
          label: 'Password Lama',
          keyName: 'old_password',
          keyboardType: TextInputType.visiblePassword,
          obscureText: !isPasswordVisible,
          showObscureIcon: true,
          onSuffixIconClick: () {
            context.read<ForgotPasswordCubit>().setOldPasswordVisibility();
          },
          validators: FormBuilderValidators.compose([
            FormBuilderValidators.required(context),
          ]),
          onChanged: (value) {
            context
                .read<ForgotPasswordCubit>()
                .oldPasswordChanged(value ?? '', true);
          },
        );
      },
    );
  }
}
