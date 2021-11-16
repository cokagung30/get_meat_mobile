part of '../home_page.dart';

class _SellerListComponent extends StatelessWidget {
  const _SellerListComponent({Key? key, required this.sellers})
      : super(key: key);

  final List<Seller> sellers;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 180.h,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 16.w, right: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Temukan Pedagang Terbaik Disini',
                  style: GetMeatTextStyle.blackFontStyle2,
                ),
                GestureDetector(
                  onTap: () => Get.toNamed(GetMeatScreen.searchSeller),
                  child: const Icon(Icons.arrow_right),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Row(
                  children: sellers
                      .map(
                        (e) => Container(
                          padding: EdgeInsets.only(
                            left: (e == sellers.first) ? 16 : 0,
                            right: 16,
                          ),
                          child: GestureDetector(
                            onTap: () {},
                            child: _buildSellerItem(
                              e,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSellerItem(Seller seller) {
    return Container(
      width: 100.w,
      height: 130.h,
      padding: EdgeInsets.only(top: 12.h, left: 12.w, right: 12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.w),
        color: GetMeatColors.green.withOpacity(0.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GetMeatPhotoProfile(
            imageUrl: (seller.photoPicSeller == '')
                ? null
                : "$imageURL${seller.photoPicSeller}",
            width: 46.w,
            height: 46.h,
          ),
          SizedBox(
            height: 28.h,
          ),
          Text(
            seller.sellerName,
            overflow: TextOverflow.ellipsis,
            style: GetMeatTextStyle.blackFontStyle2.copyWith(fontSize: 12.sp),
          ),
          Text(
            "${seller.city.name}, ${seller.province.name}",
            overflow: TextOverflow.ellipsis,
            style: GetMeatTextStyle.blackFontStyle2.copyWith(
              fontSize: 10.sp,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
