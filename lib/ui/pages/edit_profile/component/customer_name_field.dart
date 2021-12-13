part of '../edit_profile_screen.dart';

class _CustomerNameField extends StatelessWidget {
  const _CustomerNameField(this.keyField, this.customerName);

  final GlobalKey<FormBuilderFieldState>? keyField;
  final String customerName;

  @override
  Widget build(BuildContext context) {
    return GetMeatTextInput(
      initialValue: customerName,
      label: 'Nama Pembeli',
      keyName: 'customer_name',
      keyboardType: TextInputType.text,
      obscureText: false,
      showObscureIcon: false,
      validators: FormBuilderValidators.compose([
        FormBuilderValidators.required(context),
      ]),
      onChanged: (value) => context
          .read<EditProfileCubit>()
          .customerNameChanged(value ?? customerName),
    );
  }
}
