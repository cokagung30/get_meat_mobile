part of '../edit_profile_screen.dart';

class _EditProfileButton extends StatelessWidget {
  const _EditProfileButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMeatButton(
      label: 'Perbaharui Data',
      width: 280.w,
      height: 45.h,
      buttonColor: GetMeatColors.darkBlue,
      style: GetMeatTextStyle.whiteFontStyle1,
      onPress: () {
        context.read<EditProfileCubit>().updateUser();
      },
    );
  }
}
