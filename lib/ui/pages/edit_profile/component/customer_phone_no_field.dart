part of '../edit_profile_screen.dart';

class _PhoneNumberField extends StatelessWidget {
  const _PhoneNumberField(this.keyField, this.phoneNumberCustomer);

  final GlobalKey<FormBuilderFieldState>? keyField;
  final String phoneNumberCustomer;

  @override
  Widget build(BuildContext context) {
    return GetMeatTextInput(
      initialValue: phoneNumberCustomer,
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
      onChanged: (value) => context
          .read<EditProfileCubit>()
          .phoneNumberChanged(value ?? phoneNumberCustomer),
    );
  }
}
