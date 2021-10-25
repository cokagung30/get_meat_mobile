part of 'widget.dart';

class GetMeatTextInput extends StatelessWidget {
  const GetMeatTextInput({
    Key? key,
    required this.label,
    required this.keyName,
    required this.keyboardType,
    required this.obscureText,
    required this.showObscureIcon,
    this.keyField,
    this.onSuffixIconClick,
    this.onChanged,
    this.validators,
  }) : super(key: key);

  final String label;

  final String keyName;

  final GlobalKey<FormBuilderFieldState>? keyField;

  final GestureTapCallback? onSuffixIconClick;

  final TextInputType keyboardType;

  final ValueChanged<String?>? onChanged;

  final FormFieldValidator<String>? validators;

  final bool obscureText;

  final bool showObscureIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GetMeatTextStyle.grayFontStyle1,
        ),
        SizedBox(
          height: 6.h,
        ),
        FormBuilderTextField(
          key: keyField,
          name: keyName,
          obscureText: obscureText,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            suffixIconConstraints: BoxConstraints(maxHeight: 48.h),
            suffixIcon: showObscureIcon
                ? IconButton(
                    onPressed: () => onSuffixIconClick?.call(),
                    icon: Icon(
                        obscureText ? Icons.visibility : Icons.visibility_off))
                : const SizedBox.shrink(),
            isDense: true,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            contentPadding:
                EdgeInsets.only(top: 12.h, bottom: 12.h, left: 12.w),
          ),
          onChanged: onChanged,
          validator: validators,
          keyboardType: keyboardType,
        )
      ],
    );
  }
}
