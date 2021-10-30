part of '../../pages.dart';

class _CustomerNameField extends StatelessWidget {
  const _CustomerNameField(this.keyField);

  final GlobalKey<FormBuilderFieldState>? keyField;

  @override
  Widget build(BuildContext context) {
    return GetMeatTextInput(
      label: 'Nama Pembeli',
      keyName: 'customer_name',
      keyboardType: TextInputType.text,
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

        context.read<SignUpCubit>().customerNameChanged(value!, validated);
      },
    );
  }
}
