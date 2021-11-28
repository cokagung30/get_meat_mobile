import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_meat_apps/helper/file_compress_helper.dart';
import 'package:get_meat_apps/model/models.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_meat_apps/routes/get_meat_screen.dart';
import 'package:get_meat_apps/services/services.dart';
import 'package:get_meat_apps/shared/assets.dart';
import 'package:get_meat_apps/shared/colors.dart';
import 'package:get_meat_apps/shared/text_style.dart';
import 'package:get_meat_apps/ui/base/custom_view_with_toolbar.dart';
import 'package:get_meat_apps/ui/widget/widget.dart';
import 'package:image_picker/image_picker.dart';

import 'cubit/upload_photo_cubit.dart';

part 'component/profile_photo_component.dart';
part 'component/upload_photo_bottomsheet.dart';
part 'component/upload_photo_button.dart';

class UpdatePhotoProfile extends StatefulWidget {
  const UpdatePhotoProfile({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  _UpdatePhotoProfileState createState() => _UpdatePhotoProfileState();
}

class _UpdatePhotoProfileState extends State<UpdatePhotoProfile> {
  Future<void> _onUploadPhoto(UploadPhotoState state) async {
    if (state.asyncUpload.isSuccess) {
      if (state.asyncUpload.data!.isSuccess != false) {
        Get.offAllNamed(GetMeatScreen.main);
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
                  _ProfilePhotoComponent(
                    photoProfile: widget.user.customerProfilePicture,
                  ),
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
                            'Kembali',
                            style: GetMeatTextStyle.grayFontStyle2.copyWith(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          onPressed: () => Get.offAllNamed(GetMeatScreen.main),
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
