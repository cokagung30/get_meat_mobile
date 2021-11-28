part of '../sended_proof_screen.dart';

class _UploadProofButtonComponent extends StatelessWidget {
  const _UploadProofButtonComponent({
    Key? key,
    required this.orderId,
  }) : super(key: key);

  final int orderId;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      child: GetMeatButton(
        label: 'Upload Bukti Transfer ',
        width: double.infinity,
        height: 40.h,
        buttonColor: GetMeatColors.darkBlue,
        style: GetMeatTextStyle.whiteFontStyle1.copyWith(
          fontSize: 16.sp,
        ),
        onPress: () {
          context.read<SendedProofCubit>().uploadPhotoSendProof(orderId);
        },
      ),
    );
  }
}
