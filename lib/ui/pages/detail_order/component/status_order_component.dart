part of '../detail_order_screen.dart';

class _StatusOrderComponent extends StatelessWidget {
  const _StatusOrderComponent({Key? key, this.orderStatus}) : super(key: key);

  final String? orderStatus;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.sp),
        color: (orderStatus == "2")
            ? GetMeatColors.yellow
            : (orderStatus == "3")
                ? GetMeatColors.lightBlue
                : GetMeatColors.green,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            (orderStatus == "2")
                ? 'Pesanan Diproses'
                : (orderStatus == "3")
                    ? 'Sedang Dikirim'
                    : 'Selesai',
            style: GetMeatTextStyle.blackFontStyle2.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: (orderStatus == "2") ? Colors.black : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
