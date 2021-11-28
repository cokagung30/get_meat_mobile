import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_meat_apps/routes/get_meat_screen.dart';
import 'package:get_meat_apps/shared/colors.dart';
import 'package:get_meat_apps/shared/text_style.dart';
import 'package:get_meat_apps/ui/pages/rating/cubit/rating_cubit.dart';
import 'package:get_meat_apps/ui/widget/widget.dart';

part 'component/header_component.dart';
part 'component/input_component.dart';
part 'component/rating_component.dart';
part 'component/rating_upload_button_component.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({Key? key}) : super(key: key);

  @override
  _RatingScreenState createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  final _commentTextField = GlobalKey<FormBuilderFieldState>();

  Future<void> _onPostRate(RatingState state) async {
    if (state.asyncRating.isSuccess) {
      Get.offAllNamed(
        GetMeatScreen.main,
      );
    } else {
      showDialogLoading(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RatingCubit(),
      child: BlocListener<RatingCubit, RatingState>(
        listenWhen: (prev, curr) => prev.asyncRating != curr.asyncRating,
        listener: (_, state) => _onPostRate(state),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white70,
            body: Column(
              children: [
                const _HeaderComponent(),
                Expanded(
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 24.h,
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                            horizontal: 24.w, vertical: 16.h),
                        margin: EdgeInsets.symmetric(horizontal: 8.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.sp),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            const _RatingComponent(),
                            SizedBox(
                              height: 6.h,
                            ),
                            _InputComponent(_commentTextField),
                            SizedBox(height: 30.h),
                            const _RatingUploadButtonComponent()
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
