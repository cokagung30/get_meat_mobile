part of '../detail_order_screen.dart';

class _ItemOrderComponent extends StatelessWidget {
  const _ItemOrderComponent({Key? key, required this.order}) : super(key: key);

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
            'Produk dipesan',
            style: GetMeatTextStyle.blackFontStyle2.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          _buildItemOrder(),
          SizedBox(
            height: 8.h,
          ),
          SizedBox(
            height: 16.h,
          ),
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
                  title: 'Total Harga',
                  amount: ((order.quantityOrder) * (order.product.price / 1000))
                      .toDouble()),
              SizedBox(
                height: 6.h,
              ),
              _buildDetailTransactioItem(
                title: 'Ongkir',
                amount: order.costSend.toDouble(),
              ),
              SizedBox(
                height: 6.h,
              ),
              _buildDetailTransactioItem(
                title: 'Total Bayar',
                amount:
                    order.paymentAmount.toDouble() + order.costSend.toDouble(),
                isTotalPrice: true,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildItemOrder() {
    // print('$imageURL${cart?.photoProduct}');
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GetMeatPhotoProfile(
              imageUrl: (order.product.photoProduct != null)
                  ? '$imageURL${order.product.photoProduct}'
                  : null,
              width: 50.w,
              height: 50.h,
            ),
            SizedBox(
              width: 12.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  order.product.productName,
                  style: GetMeatTextStyle.blackFontStyle2,
                ),
                Text(
                  '${NumberFormat.currency(
                    locale: 'id-ID',
                    symbol: 'Rp. ',
                    decimalDigits: 0,
                  ).format(order.product.price)} / kilogram',
                  style: GetMeatTextStyle.grayFontStyle1.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.normal,
                  ),
                )
              ],
            )
          ],
        ),
        Text(
          '${order.quantityOrder} g',
          style: GetMeatTextStyle.grayFontStyle1.copyWith(fontSize: 14.sp),
        )
      ],
    );
  }

  Widget _buildDetailTransactioItem(
      {required String title,
      required double amount,
      bool isTotalPrice = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GetMeatTextStyle.grayFontStyle1.copyWith(fontSize: 14),
        ),
        Text(
          NumberFormat.currency(
            locale: 'id-ID',
            symbol: 'Rp. ',
            decimalDigits: 0,
          ).format(amount),
          style: GetMeatTextStyle.blackFontStyle2.copyWith(
            fontSize: 14,
            color: (isTotalPrice) ? GetMeatColors.green : Colors.black,
          ),
        )
      ],
    );
  }
}
