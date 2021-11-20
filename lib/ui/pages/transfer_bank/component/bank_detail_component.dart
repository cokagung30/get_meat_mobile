part of '../transfer_bank_screen.dart';

class _BankDetailComponent extends StatelessWidget {
  const _BankDetailComponent({Key? key, this.order}) : super(key: key);

  final Order? order;

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
            'Detail Transaksi',
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
                  title: 'No. Rekening',
                  value: order?.product.seller.rekeningNumber ?? ''),
              SizedBox(
                height: 6.h,
              ),
              _buildDetailTransactioItem(
                  title: 'Nama Rekening',
                  value: order?.product.seller.bankAccountName ?? ''),
              SizedBox(
                height: 6.h,
              ),
              _buildDetailTransactioItem(
                  title: 'Bank Tujuan',
                  value: order?.product.seller.bankName ?? ''),
              SizedBox(
                height: 6.h,
              ),
              _buildDetailTransactioItem(
                title: 'Total Bayar',
                value: NumberFormat.currency(
                        locale: 'id-ID', symbol: 'Rp. ', decimalDigits: 0)
                    .format(
                        (order?.costSend ?? 0) + (order?.paymentAmount ?? 0)),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildDetailTransactioItem({
    required String title,
    required String value,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GetMeatTextStyle.grayFontStyle1.copyWith(fontSize: 14),
        ),
        Text(
          value,
          style: GetMeatTextStyle.blackFontStyle2.copyWith(
            fontSize: 14,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}
