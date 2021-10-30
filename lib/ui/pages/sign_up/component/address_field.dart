part of '../../pages.dart';

class _AddressTextField extends StatelessWidget {
  const _AddressTextField(this.keyField);

  final GlobalKey<FormBuilderFieldState>? keyField;

  @override
  Widget build(BuildContext context) {
    return GetMeatTextInput(
      label: 'Alamat Pembeli',
      keyName: 'address',
      keyboardType: TextInputType.multiline,
      obscureText: false,
      showObscureIcon: false,
      validators: FormBuilderValidators.compose(
          [FormBuilderValidators.required(context)]),
      onChanged: (value) {
        final bool validated;

        if (keyField!.currentState != null) {
          validated = keyField!.currentState!.validate();
        } else {
          validated = false;
        }

        context.read<SignUpCubit>().addressChanged(value!, validated);
      },
    );
  }
}
