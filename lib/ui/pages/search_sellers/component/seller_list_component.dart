part of '../search_sellers_screen.dart';

class _SellerListComponent extends StatelessWidget {
  const _SellerListComponent({
    Key? key,
    required this.sellers,
  }) : super(key: key);

  final List<Seller> sellers;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ListView(
        shrinkWrap: true,
        children:
            sellers.map((seller) => _buildSellerListItem(seller)).toList(),
      ),
    );
  }

  Widget _buildSellerListItem(Seller seller) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GetMeatPhotoProfile(
                      imageUrl: (seller.photoPicSeller == '')
                          ? null
                          : "$imageURL${seller.photoPicSeller}",
                      width: 40.w,
                      height: 40.h,
                    ),
                    SizedBox(width: 12.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          seller.sellerName,
                          overflow: TextOverflow.ellipsis,
                          style: GetMeatTextStyle.blackFontStyle2,
                        ),
                        SizedBox(height: 2.h),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${seller.city.name}, ${seller.province.name}',
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
                GestureDetector(
                  onTap: () {
                    Get.toNamed(
                      GetMeatScreen.sellerDetail,
                      arguments: {
                        'id': seller.id,
                      },
                    );
                  },
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    size: 24,
                    color: GetMeatColors.lightGray,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 16.h),
          Container(
            width: double.infinity,
            height: 0.2.h,
            color: GetMeatColors.lightGray,
          ),
        ],
      ),
    );
  }
}
