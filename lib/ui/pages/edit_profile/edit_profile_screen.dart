import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get_meat_apps/routes/get_meat_screen.dart';
import 'package:get_meat_apps/shared/assets.dart';
import 'package:get_meat_apps/shared/colors.dart';
import 'package:get_meat_apps/shared/text_style.dart';
import 'package:get_meat_apps/ui/pages/edit_profile/cubit/edit_profile_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_meat_apps/ui/widget/widget.dart';

part 'component/header_component.dart';
part 'component/customer_name_field.dart';
part 'component/customer_email_field.dart';
part 'component/customer_no_wa_field.dart';
part 'component/customer_phone_no_field.dart';
part 'component/customer_address_field.dart';
part 'component/edit_profile_button.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _emailTextField = GlobalKey<FormBuilderFieldState>();
  final _customerNameTextField = GlobalKey<FormBuilderFieldState>();
  final _whatsappNumberTextField = GlobalKey<FormBuilderFieldState>();
  final _phoneNumberTextField = GlobalKey<FormBuilderFieldState>();
  final _addressTextField = GlobalKey<FormBuilderFieldState>();

  Future<void> _onListener(EditProfileState state) async {
    if (state.asyncUpdateUser.isLoading) {
      showDialogLoading(context);
    } else if (state.asyncUpdateUser.isError) {
      Get.back();
      showDialog(
        context: context,
        builder: (_) {
          return const GetMeatDialogWidget(
            title: 'Registrasi gagal',
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
      create: (_) => EditProfileCubit(),
      child: BlocListener<EditProfileCubit, EditProfileState>(
        listenWhen: (prev, curr) =>
            prev.asyncUpdateUser != curr.asyncUpdateUser,
        listener: (context, state) => _onListener(state),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white70,
            body: Builder(
              builder: (context) {
                return Column(
                  children: [
                    const _HeaderComponent(),
                    Expanded(
                      child: BlocBuilder<EditProfileCubit, EditProfileState>(
                        builder: (_, state) {
                          if (state.asyncUser.isSuccess) {
                            return ListView(
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
                                      _CustomerNameField(
                                        _customerNameTextField,
                                        state.customerName,
                                      ),
                                      SizedBox(height: 20.h),
                                      _EmailCustomerField(
                                        _emailTextField,
                                        state.email,
                                      ),
                                      SizedBox(height: 20.h),
                                      _WhatsappNumberTextField(
                                        _whatsappNumberTextField,
                                        state.whatsAppNumber,
                                      ),
                                      SizedBox(height: 20.h),
                                      _PhoneNumberField(
                                        _phoneNumberTextField,
                                        state.phoneNumber,
                                      ),
                                      SizedBox(height: 20.h),
                                      _AddressField(
                                        _addressTextField,
                                        state.address,
                                      ),
                                      SizedBox(height: 40.h),
                                      const _EditProfileButton(),
                                      SizedBox(height: 20.h),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 24.h,
                                ),
                              ],
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 1,
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
