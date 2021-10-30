part of '../../pages.dart';

class _EmailCustomerTextField extends StatelessWidget {
  const _EmailCustomerTextField(this.keyField);

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

        context.read<SignUpCubit>().emailChanged(value!, validated);
      },
    );
  }
}
