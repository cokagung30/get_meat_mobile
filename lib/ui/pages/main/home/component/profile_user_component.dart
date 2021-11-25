part of '../home_page.dart';

class _ProfileUserComponent extends StatelessWidget {
  const _ProfileUserComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var photoProfile = locator<AuthPreferences>().getCustomerPhotoProfile();
    var displayName = locator<AuthPreferences>().getCustomerName();
    var email = locator<AuthPreferences>().getCustomerEmail();

    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 30.h, left: 16.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GetMeatPhotoProfile(
            imageUrl: (photoProfile!.isEmpty) ? null : imageURL + photoProfile,
            width: 50.w,
            height: 50.h,
          ),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$displayName',
                style: GetMeatTextStyle.blackFontStyle2,
              ),
              Text(
                '$email',
                style: GetMeatTextStyle.grayFontStyle2.copyWith(
                  fontSize: 12.sp,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
