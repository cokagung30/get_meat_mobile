part of '../edit_profile_screen.dart';

class _WhatsappNumberTextField extends StatelessWidget {
  const _WhatsappNumberTextField(this.keyField, this.whatsappNumber);

  final GlobalKey<FormBuilderFieldState>? keyField;
  final String whatsappNumber;

  @override
  Widget build(BuildContext context) {
    return GetMeatTextInput(
      initialValue: whatsappNumber,
      label: 'Nomor Whatsapp',
      keyName: 'whatsapp_number',
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
          .whatsappNumberChanged(value ?? whatsappNumber),
    );
  }
}
