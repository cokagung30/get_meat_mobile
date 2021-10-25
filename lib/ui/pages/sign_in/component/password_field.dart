part of '../../pages.dart';

typedef ShowPasswordSelector = BlocSelector<SignInCubit, SignInState, bool>;

class _PasswordTextField extends StatelessWidget {
  const _PasswordTextField(this.keyField);

  final GlobalKey<FormBuilderFieldState>? keyField;

  @override
  Widget build(BuildContext context) {
    return ShowPasswordSelector(
      selector: (state) => state.isPasswordVisible,
      builder: (_, isPasswordVisible) {
        return GetMeatTextInput(
          label: 'Password',
          keyName: 'password',
          keyboardType: TextInputType.visiblePassword,
          obscureText: !isPasswordVisible,
          showObscureIcon: true,
          onSuffixIconClick: () {
            context.read<SignInCubit>().setPasswordVisibility();
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

            context.read<SignInCubit>().passwordChanged(value!, validated);
          },
        );
      },
    );
  }
}
