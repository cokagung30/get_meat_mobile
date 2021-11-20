part of '../transfer_bank_screen.dart';

class _HeaderComponent extends StatelessWidget {
  const _HeaderComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: GetMeatColors.darkBlue,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Get.back(),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 24.sp,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Pembayaran',
                  style: GetMeatTextStyle.whiteFontStyle1.copyWith(
                    color: Colors.white,
                    fontSize: 18.sp,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  "Silahkan lakukan pembayaran ke nomor rekening berikut",
                  style: GetMeatTextStyle.whiteFontStyle1.copyWith(
                    color: Colors.white,
                    fontSize: 14.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
