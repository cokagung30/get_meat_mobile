part of '../history_order_page.dart';

class _OrderItemsComponent extends StatelessWidget {
  const _OrderItemsComponent({
    Key? key,
    this.carts,
    this.orders,
  }) : super(key: key);

  final List<Cart>? carts;
  final List<Order>? orders;

  @override
  Widget build(BuildContext context) {
    return (carts != null)
        ? ListView(
            children: carts!.map((cart) => _buildItemCart(cart)).toList(),
          )
        : ListView(
            children: orders!.map((order) => _buildItemOrder(order)).toList(),
          );
  }

  Widget _buildItemCart(Cart cart) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(GetMeatScreen.productDetail, arguments: {
          'id': cart.productId,
          'sellerId': cart.sellerId,
        });
      },
      child: Container(
        padding:
            EdgeInsets.only(top: 8.h, left: 10.w, right: 10.w, bottom: 12.h),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GetMeatPhotoProfile(
                  // ignore: unnecessary_null_comparison
                  imageUrl: (cart.photoProduct != null)
                      ? "$imageURL${cart.photoProduct}"
                      : null,
                  width: 35,
                  height: 35,
                ),
                SizedBox(
                  width: 8.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cart.productName,
                      style: GetMeatTextStyle.blackFontStyle2
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "Harga Jual: " +
                          NumberFormat.currency(
                            locale: 'id_ID',
                            symbol: 'Rp',
                            decimalDigits: 0,
                          ).format(cart.productPrice),
                      style: GetMeatTextStyle.blackFontStyle2
                          .copyWith(fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  NumberFormat.currency(
                    locale: 'id_ID',
                    symbol: 'Rp',
                    decimalDigits: 0,
                  ).format(cart.productPrice * cart.quantity),
                  style: GetMeatTextStyle.blackFontStyle2
                      .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  cart.quantity.toString() + " ${cart.unit}",
                  style: GetMeatTextStyle.blackFontStyle2.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemOrder(Order order) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(GetMeatScreen.orderDetail, arguments: {'order': order});
      },
      child: Container(
        padding:
            EdgeInsets.only(top: 8.h, left: 10.w, right: 10.w, bottom: 12.h),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GetMeatPhotoProfile(
                  // ignore: unnecessary_null_comparison
                  imageUrl: (order.product.photoProduct != null)
                      ? "$imageURL${order.product.photoProduct}"
                      : null,
                  width: 35,
                  height: 35,
                ),
                SizedBox(
                  width: 8.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.product.productName,
                      style: GetMeatTextStyle.blackFontStyle2
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      order.product.seller.sellerName,
                      style: GetMeatTextStyle.blackFontStyle2
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      DateFormat('yMMMMEEEEd', 'id_ID')
                          .format(DateTime.parse(order.orderDate)),
                      style: GetMeatTextStyle.blackFontStyle2
                          .copyWith(fontSize: 12, fontWeight: FontWeight.w300),
                    )
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  NumberFormat.currency(
                    locale: 'id_ID',
                    symbol: 'Rp',
                    decimalDigits: 0,
                  ).format(order.product.price),
                  style: GetMeatTextStyle.blackFontStyle2
                      .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  order.quantityOrder.toString() + " ${order.product.unit}",
                  style: GetMeatTextStyle.blackFontStyle2.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
