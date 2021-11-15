part of '../pages.dart';

class UploadPhotoScreen extends StatefulWidget {
  const UploadPhotoScreen({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  _UploadPhotoScreenState createState() => _UploadPhotoScreenState();
}

class _UploadPhotoScreenState extends State<UploadPhotoScreen> {
  Future<void> _onUploadPhoto(UploadPhotoState state) async {
    if (state.asyncUpload.isSuccess) {
      if (state.asyncUpload.data!.isSuccess != false) {
        Get.offAllNamed(GetMeatScreen.login);
      } else {
        Get.back();
        showDialog(
            context: context,
            builder: (_) {
              return GetMeatDialogWidget(
                title: 'Upload Gagal',
                subtitle: state.asyncUpload.data!.message!,
                asset: GetMeatAssets.crossCircle,
              );
            });
      }
    } else if (state.asyncUpload.isError) {
      Get.back();
      showDialog(
          context: context,
          builder: (_) {
            return const GetMeatDialogWidget(
              title: 'Upload foto gagal',
              subtitle: 'Terdapat kesalahan, silahkan coba kembali !!',
              asset: GetMeatAssets.crossCircle,
            );
          });
    } else {
      showDialogLoading(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UploadPhotoCubit(),
      child: BlocListener<UploadPhotoCubit, UploadPhotoState>(
        listenWhen: (previous, current) {
          return previous.asyncUpload != current.asyncUpload;
        },
        listener: (_, state) {
          _onUploadPhoto(state);
        },
        child: CustomViewWithToolbar(
          leadingIcon: Icons.arrow_back,
          onLeadingIconTap: () => Get.back(),
          title: 'Upload Photo',
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 40.h),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const _ProfilePhotoComponent(),
                  SizedBox(
                    height: 26.h,
                  ),
                  Column(
                    children: [
                      Text(
                        widget.user.customerName,
                        style: GetMeatTextStyle.blackFontStyle3,
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Text(
                        widget.user.customerEmail,
                        style: GetMeatTextStyle.grayFontStyle2.copyWith(
                          fontSize: ScreenUtil().setSp(14),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(
                        height: 88.h,
                      ),
                      _UploadPhotoButton(userId: widget.user.id),
                      SizedBox(
                        height: 30.h,
                      ),
                      Center(
                        child: TextButton(
                          child: Text(
                            'Lewati tahap ini',
                            style: GetMeatTextStyle.grayFontStyle2.copyWith(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          onPressed: () => Get.offAllNamed(GetMeatScreen.login),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
