part of '../profile_page.dart';

// ignore: must_be_immutable
class _ProfileUserLoggedComponent extends StatelessWidget {
  var photoProfile = locator<AuthPreferences>().getCustomerPhotoProfile();
  var displayName = locator<AuthPreferences>().getCustomerName();
  var email = locator<AuthPreferences>().getCustomerEmail();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            width: 130,
            height: 130,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                ScreenUtil().radius(100),
              ),
              border: Border.all(
                color: Colors.grey.withOpacity(0.2),
                width: 1,
              ),
              color: Colors.white,
            ),
            child: GetMeatPhotoProfile(
              imageUrl:
                  (photoProfile == null) ? null : "$imageURL$photoProfile",
              width: 130,
              height: 130,
            ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(16),
          ),
          Column(
            children: [
              Text(
                displayName ?? '',
                style: GetMeatTextStyle.blackFontStyle1,
              ),
              Text(email ?? '', style: GetMeatTextStyle.grayFontStyle2),
            ],
          )
        ],
      ),
    );
  }
}
