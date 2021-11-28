part of '../home_page.dart';

class _ProfileUserComponent extends StatelessWidget {
  const _ProfileUserComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var photoProfile = locator<AuthPreferences>().getCustomerPhotoProfile();
    var displayName = locator<AuthPreferences>().getCustomerName();
    var email = locator<AuthPreferences>().getCustomerEmail();

    return BlocSelector<ProfileCubit, ProfileState,
            AsyncState<ApiReturnValue<User>>>(
        selector: (state) => state.asyncUser,
        builder: (context, async) {
          if (async.isSuccess) {
            var user = async.data!.value;
            return Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 30.h, left: 16.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GetMeatPhotoProfile(
                    imageUrl: (user!.customerProfilePicture.isEmpty)
                        ? null
                        : imageURL + user.customerProfilePicture,
                    width: 50.w,
                    height: 50.h,
                  ),
                  SizedBox(width: 12.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.customerName,
                        style: GetMeatTextStyle.blackFontStyle2,
                      ),
                      Text(
                        user.customerEmail,
                        style: GetMeatTextStyle.grayFontStyle2.copyWith(
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 1,
              ),
            );
          }
        });
  }
}
