part of '../forgot_password_screen.dart';

class _CustomerEmailField extends StatelessWidget {
  const _CustomerEmailField(
    this.keyField,
  );

  final GlobalKey<FormBuilderFieldState>? keyField;

  @override
  Widget build(BuildContext context) {
    return GetMeatTextInput(
      label: 'Email',
      keyName: 'email',
      keyboardType: TextInputType.emailAddress,
      obscureText: false,
      showObscureIcon: false,
      validators: FormBuilderValidators.compose([
        FormBuilderValidators.required(context),
        FormBuilderValidators.email(context)
      ]),
      onChanged: (value) {
        context.read<ForgotPasswordCubit>().emailChanged(value ?? '', true);
      },
    );
  }
}
