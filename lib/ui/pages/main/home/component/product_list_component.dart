part of '../home_page.dart';

class _ProductListComponent extends StatelessWidget {
  const _ProductListComponent({Key? key, required this.products})
      : super(key: key);

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 5.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Produk Terbaik Untukmu',
                  style: GetMeatTextStyle.blackFontStyle2,
                ),
                GestureDetector(
                  onTap: () => Get.toNamed(GetMeatScreen.searchProduct),
                  child: const Icon(Icons.arrow_right),
                )
              ],
            ),
          ),
          Column(
            children: products
                .map(
                  (e) => GestureDetector(
                    onTap: () => Get.toNamed(
                      GetMeatScreen.productDetail,
                      arguments: {
                        'id': e.id,
                        'sellerId': e.seller.id,
                      },
                    ),
                    child: _buildProductItem(e),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildProductItem(Product product) {
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
