part of '../seller_detail_screen.dart';

class _AppBarDetailComponent extends StatelessWidget {
  const _AppBarDetailComponent({
    Key? key,
    required this.seller,
  }) : super(key: key);

  final Seller seller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: GetMeatColors.darkBlue,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Get.back(),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 24.sp,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  seller.sellerName,
                  style: GetMeatTextStyle.whiteFontStyle1.copyWith(
                    color: Colors.white,
                    fontSize: 20.sp,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  "${seller.province.name}, ${seller.city.name}",
                  style: GetMeatTextStyle.whiteFontStyle1.copyWith(
                    color: Colors.white,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
          GetMeatPhotoProfile(
            imageUrl: (seller.photoPicSeller != '')
                ? "$imageURL${seller.photoPicSeller}"
                : null,
            width: 46,
            height: 46,
          )
        ],
      ),
    );
  }
}
