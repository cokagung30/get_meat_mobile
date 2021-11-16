part of '../seller_detail_screen.dart';

class _ProductItemComponent extends StatelessWidget {
  const _ProductItemComponent({Key? key, required this.product})
      : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GetMeatPhotoProfile(
                imageUrl: (product.photoProduct == '')
                    ? null
                    : "$imageURL${product.photoProduct}",
                width: 40.w,
                height: 40.h,
              ),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.productName,
                    overflow: TextOverflow.ellipsis,
                    style: GetMeatTextStyle.blackFontStyle2,
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Stok: ${product.stock} ${product.unit}',
                        style: GetMeatTextStyle.grayFontStyle1.copyWith(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Container(
                        width: 5.w,
                        height: 5.h,
                        margin: EdgeInsets.symmetric(horizontal: 4.w),
                        decoration: BoxDecoration(
                          color: GetMeatColors.green,
                          borderRadius: BorderRadius.circular(2.5),
                        ),
                      ),
                      Text(
                        product.seller.sellerName,
                        overflow: TextOverflow.ellipsis,
                        style: GetMeatTextStyle.grayFontStyle1.copyWith(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Text(
            NumberFormat.simpleCurrency(
              locale: 'id_ID',
              name: 'Rp. ',
              decimalDigits: 0,
            ).format(product.price),
            style: GetMeatTextStyle.blackFontStyle2.copyWith(
              color: GetMeatColors.yellow,
            ),
          ),
        ],
      ),
    );
  }
}
