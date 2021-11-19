part of '../payment_screen.dart';

class _OrderByComponent extends StatelessWidget {
  const _OrderByComponent({Key? key, this.user}) : super(key: key);

  final User? user;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.sp),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Dikirim kepada',
            style: GetMeatTextStyle.blackFontStyle2.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 8.h,
              ),
              _buildDetailTransactioItem(
                  title: 'Nama: ', data: user?.customerName ?? ''),
              SizedBox(
                height: 6.h,
              ),
              _buildDetailTransactioItem(
                  title: 'No. Telp', data: user?.customerPhoneNumber ?? ''),
              SizedBox(
                height: 6.h,
              ),
              _buildDetailTransactioItem(
                  title: 'No. Whatsapp',
                  data: user?.customerWhatsappNumber ?? ''),
              SizedBox(
                height: 6.h,
              ),
              _buildDetailTransactioItem(
                title: 'Alamat',
                data: user?.customerAddress ?? '',
              ),
              SizedBox(
                height: 6.h,
              ),
              _buildDetailTransactioItem(
                title: 'Wilayah',
                data:
                    '${user?.cities?.name ?? ''}, ${user?.province?.name ?? ''}',
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildDetailTransactioItem(
      {required String title,
      required String data,
      bool isTotalPrice = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GetMeatTextStyle.grayFontStyle1.copyWith(fontSize: 14),
        ),
        SizedBox(
          width: 150.w,
          child: Text(
            data,
            // overflow: TextOverflow.ellipsis,
            style: GetMeatTextStyle.blackFontStyle2.copyWith(
              fontSize: 14,
              color: (isTotalPrice) ? GetMeatColors.green : Colors.black,
            ),
            textAlign: TextAlign.right,
          ),
        )
      ],
    );
  }
}
