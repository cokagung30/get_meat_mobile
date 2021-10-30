part of '../../pages.dart';

typedef ShowPasswordCustomerSelector
    = BlocSelector<SignUpCubit, SignUpState, bool>;

class _PasswordCustomerTextField extends StatelessWidget {
  const _PasswordCustomerTextField(this.keyField);

  final GlobalKey<FormBuilderFieldState>? keyField;

  @override
  Widget build(BuildContext context) {
    return ShowPasswordCustomerSelector(
      selector: (state) => state.isPasswordVisible,
      builder: (_, isPasswordVisible) {
        return GetMeatTextInput(
          label: 'Password',
          keyName: 'password_customer',
          keyboardType: TextInputType.visiblePassword,
          obscureText: !isPasswordVisible,
          showObscureIcon: true,
          onSuffixIconClick: () {
            context.read<SignUpCubit>().setPasswordVisibility();
          },
          validators: FormBuilderValidators.compose([
            FormBuilderValidators.required(context),
          ]),
          onChanged: (value) {
            final bool validated;

            if (keyField!.currentState != null) {
              validated = keyField!.currentState!.validate();
            } else {
              validated = false;
            }

            context.read<SignUpCubit>().passwordChanged(value!, validated);
          },
        );
      },
    );
  }
}
