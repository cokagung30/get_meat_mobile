part of '../upload_photo_screen.dart';

class _UploadPhotoButton extends StatelessWidget {
  const _UploadPhotoButton({Key? key, required this.userId}) : super(key: key);

  final int userId;

  @override
  Widget build(BuildContext context) {
    return GetMeatButton(
      label: 'Upload dan Lanjutkan',
      width: 280.w,
      height: 45.h,
      buttonColor: GetMeatColors.lightBlue,
      style: GetMeatTextStyle.whiteFontStyle1,
      onPress: () {
        context.read<UploadPhotoCubit>().uploadPhoto(userId);
      },
    );
  }
}
