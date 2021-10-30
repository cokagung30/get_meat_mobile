part of '../../pages.dart';

class _PhoneNumberTextField extends StatelessWidget {
  const _PhoneNumberTextField(this.keyField);

  final GlobalKey<FormBuilderFieldState>? keyField;

  @override
  Widget build(BuildContext context) {
    return GetMeatTextInput(
      label: 'Nomor Telephone',
      keyName: 'phone_number',
      keyboardType: TextInputType.number,
      obscureText: false,
      showObscureIcon: false,
      validators: FormBuilderValidators.compose([
        FormBuilderValidators.required(context),
        FormBuilderValidators.minLength(context, 10),
        FormBuilderValidators.numeric(context)
      ]),
      onChanged: (value) {
        final bool validated;

        if (keyField!.currentState != null) {
          validated = keyField!.currentState!.validate();
        } else {
          validated = false;
        }

        context.read<SignUpCubit>().phoneNumberChanged(value!, validated);
      },
    );
  }
}
