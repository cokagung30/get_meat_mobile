part of '../edit_profile_screen.dart';

class _EmailCustomerField extends StatelessWidget {
  const _EmailCustomerField(this.keyField, this.emailCustomer);

  final GlobalKey<FormBuilderFieldState>? keyField;
  final String emailCustomer;

  @override
  Widget build(BuildContext context) {
    return GetMeatTextInput(
        initialValue: emailCustomer,
        label: 'Email',
        keyName: 'email',
        keyboardType: TextInputType.emailAddress,
        obscureText: false,
        showObscureIcon: false,
        validators: FormBuilderValidators.compose([
          FormBuilderValidators.required(context),
          FormBuilderValidators.email(context)
        ]),
        onChanged: (value) => context
            .read<EditProfileCubit>()
            .emailChanged(value ?? emailCustomer));
  }
}
