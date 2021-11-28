part of '../detail_order_screen.dart';

class _OrderDetailComponent extends StatelessWidget {
  const _OrderDetailComponent({
    Key? key,
    required this.order,
  }) : super(key: key);

  final Order order;

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
            'Detail Pesanan',
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
                  title: 'No. Pemesanan', data: order.orderNumber),
              SizedBox(
                height: 6.h,
              ),
              _buildDetailTransactioItem(
                  title: 'Tgl. Pemesanan',
                  data: DateFormat('yMMMd', 'id_ID')
                      .format(DateTime.parse(order.orderDate))),
              SizedBox(
                height: 6.h,
              ),
              _buildDetailTransactioItem(
                  title: 'Tipe Pembayaran', data: order.typePayment),
              SizedBox(
                height: 6.h,
              ),
              _buildDetailTransactioItem(
                  title: 'Alamat Pemesanan', data: order.orderAddress),
              SizedBox(
                height: 6.h,
              ),
              _buildDetailTransactioItem(
                title: 'Nama Pedagang',
                data: order.product.seller.sellerName,
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
          style: GetMeatTextStyle.grayFontStyle1.copyWith(fontSize: 12),
        ),
        SizedBox(
          width: 150.w,
          child: Text(
            data,
            // overflow: TextOverflow.ellipsis,
            style: GetMeatTextStyle.blackFontStyle2.copyWith(
              fontSize: 12,
              color: (isTotalPrice) ? GetMeatColors.green : Colors.black,
            ),
            textAlign: TextAlign.right,
          ),
        )
      ],
    );
  }
}
