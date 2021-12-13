import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_meat_apps/routes/get_meat_screen.dart';
import 'package:get_meat_apps/shared/assets.dart';
import 'package:get_meat_apps/shared/colors.dart';
import 'package:get_meat_apps/shared/text_style.dart';
import 'package:get_meat_apps/ui/pages/edit_profile/cubit/edit_profile_cubit.dart';
import 'package:get_meat_apps/ui/pages/forgot-password/cubit/forgot_password_cubit.dart';
import 'package:get_meat_apps/ui/widget/widget.dart';

part 'component/header_component.dart';
part 'component/customer_email_field.dart';
part 'component/customer_old_password_field.dart';
part 'component/customer_new_password_field.dart';
part 'component/forgot_password_button.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _customerEmailTextField = GlobalKey<FormBuilderFieldState>();
  final _customerOldPasswordTextField = GlobalKey<FormBuilderFieldState>();
  final _customerNewPasswordTextField = GlobalKey<FormBuilderFieldState>();

  Future<void> _onListener(ForgotPasswordState state) async {
    if (state.asyncChangePassword.isLoading) {
      showDialogLoading(context);
    } else if (state.asyncChangePassword.isError) {
      Get.back();
      showDialog(
        context: context,
        builder: (_) {
          return const GetMeatDialogWidget(
            title: 'Update Password Gagal',
            subtitle: 'Terdapat kesalahan, silahkan coba kembali !!',
            asset: GetMeatAssets.crossCircle,
          );
        },
      );
    } else {
      Get.offAllNamed(GetMeatScreen.main);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ForgotPasswordCubit(),
      child: BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
        listenWhen: (previous, current) =>
            previous.asyncChangePassword != current.asyncChangePassword,
        listener: (context, state) => _onListener(state),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white70,
            body: Builder(builder: (context) {
              return Column(
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
                          horizontal: 24.w,
                          vertical: 16.h,
                        ),
                        margin: EdgeInsets.symmetric(
                          horizontal: 10.w,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.sp),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 6.h),
                            _CustomerEmailField(_customerEmailTextField),
                            SizedBox(height: 20.h),
                            _CustomerOldPasswordField(
                              _customerOldPasswordTextField,
                            ),
                            SizedBox(height: 20.h),
                            _CustomerNewPasswordField(
                              _customerNewPasswordTextField,
                            ),
                            SizedBox(height: 40.h),
                            const _ButtonForgotPassword(),
                            SizedBox(height: 20.h),
                          ],
                        ),
                      )
                    ],
                  ))
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
