part of '../edit_profile_screen.dart';

class _AddressField extends StatelessWidget {
  const _AddressField(this.keyField, this.address);

  final GlobalKey<FormBuilderFieldState>? keyField;
  final String address;

  @override
  Widget build(BuildContext context) {
    return GetMeatTextInput(
      initialValue: address,
      label: 'Alamat Pembeli',
      keyName: 'address',
      keyboardType: TextInputType.multiline,
      obscureText: false,
      showObscureIcon: false,
      validators: FormBuilderValidators.compose(
          [FormBuilderValidators.required(context)]),
      onChanged: (value) =>
          context.read<EditProfileCubit>().addressChanged(value ?? address),
    );
  }
}
