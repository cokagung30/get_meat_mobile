part of '../../pages.dart';

class _EmailTextField extends StatelessWidget {
  const _EmailTextField(this.keyField);

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
        final bool validated;

        if (keyField!.currentState != null) {
          validated = keyField!.currentState!.validate();
        } else {
          validated = false;
        }

        context.read<SignInCubit>().emailChanged(value!, validated);
      },
    );
  }
}
