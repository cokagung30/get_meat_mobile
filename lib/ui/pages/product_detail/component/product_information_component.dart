part of '../product_detail_screen.dart';

class _ProductInformationComponent extends StatelessWidget {
  const _ProductInformationComponent({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product? product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product!.productName,
                style: GetMeatTextStyle.blackFontStyle1,
              ),
              SizedBox(height: 4.h),
              Row(
                children: [
                  Icon(Icons.price_change_outlined,
                      size: 16.w, color: GetMeatColors.green),
                  SizedBox(width: 4.w),
                  Text(
                    NumberFormat.currency(
                          locale: 'id_ID',
                          symbol: 'Rp. ',
                          decimalDigits: 0,
                        ).format(product?.price ?? 0) +
                        " / ${product?.unit}",
                    style: GetMeatTextStyle.blackFontStyle2.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Container(
                    width: 5.w,
                    height: 5.h,
                    margin: EdgeInsets.symmetric(horizontal: 8.w),
                    decoration: BoxDecoration(
                      color: GetMeatColors.yellow,
                      borderRadius: BorderRadius.circular(2.5.sp),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Stock : ',
                          style: GetMeatTextStyle.blackFontStyle2.copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text:
                              '${product?.stock} g / ${(product?.stock ?? 0) / 1000} kg',
                          style: GetMeatTextStyle.blackFontStyle2.copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Text(
                product?.description ?? "",
                style: GetMeatTextStyle.grayFontStyle2.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
        _buildDivider(),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      width: double.infinity,
      height: 5.h,
      color: GetMeatColors.lightGray.withOpacity(0.2),
    );
  }
}
