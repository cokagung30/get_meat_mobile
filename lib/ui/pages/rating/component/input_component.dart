part of '../rating_screen.dart';

class _InputComponent extends StatelessWidget {
  const _InputComponent(this.keyField);

  final GlobalKey<FormBuilderFieldState>? keyField;

  @override
  Widget build(BuildContext context) {
    return GetMeatTextInput(
      label: '',
      keyName: 'comment',
      keyboardType: TextInputType.multiline,
      obscureText: false,
      showObscureIcon: false,
      validators: FormBuilderValidators.compose([
        FormBuilderValidators.required(context),
      ]),
      onChanged: (value) {
        final bool validated;

        if (keyField!.currentState != null) {
          validated = keyField!.currentState!.validate();
        } else {
          validated = false;
        }

        context.read<RatingCubit>().commentChanged(value!, validated);
      },
    );
  }
}
