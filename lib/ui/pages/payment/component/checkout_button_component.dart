part of '../payment_screen.dart';

class _CheckoutButtonComponent extends StatelessWidget {
  const _CheckoutButtonComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      child: GetMeatButton(
        label: 'Pesan Sekarang ',
        width: double.infinity,
        height: 40.h,
        buttonColor: GetMeatColors.darkBlue,
        style: GetMeatTextStyle.whiteFontStyle1.copyWith(
          fontSize: 16.sp,
        ),
        onPress: () {},
      ),
    );
  }
}
