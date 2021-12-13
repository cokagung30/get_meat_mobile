part of '../forgot_password_screen.dart';

class _ButtonForgotPassword extends StatelessWidget {
  const _ButtonForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMeatButton(
      label: 'Perbaharui Password',
      width: 280.w,
      height: 45.h,
      buttonColor: GetMeatColors.darkBlue,
      style: GetMeatTextStyle.whiteFontStyle1,
      onPress: () {
        context.read<ForgotPasswordCubit>().changePassword();
      },
    );
  }
}
