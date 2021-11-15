import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_meat_apps/data/preferences/auth_preferences.dart';
import 'package:get_meat_apps/injection.dart';
import 'package:get_meat_apps/routes/get_meat_screen.dart';
import 'package:get_meat_apps/services/services.dart';
import 'package:get_meat_apps/shared/assets.dart';
import 'package:get_meat_apps/shared/colors.dart';
import 'package:get_meat_apps/shared/text_style.dart';
import 'package:get_meat_apps/ui/pages/main/profile/cubit/profile_cubit.dart';
import 'package:get_meat_apps/ui/widget/widget.dart';

part 'component/profile_user_logged_component.dart';
part 'component/profile_item_option_component.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: GetMeatColors.darkBlue,
        ),
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: ListView(
            children: [
              SizedBox(height: 40.h),
              _ProfileUserLoggedComponent(),
              SizedBox(height: 30.h),
              const _ProfileItemOptionComponent(
                icon: Icons.account_circle_outlined,
                title: 'Edit Data Diri',
                subtitle: 'Perbaharui Data Diri Disini',
              ),
              SizedBox(height: 16.h),
              const _ProfileItemOptionComponent(
                icon: Icons.lock_outlined,
                title: 'Edit Password',
                subtitle: 'Perbaharui Password Disini',
              ),
              SizedBox(height: 16.h),
              const _ProfileItemOptionComponent(
                icon: Icons.photo_camera_front_rounded,
                title: 'Update Foto Profile',
                subtitle: 'Perbaharui Foto Profile Disini',
              ),
              SizedBox(height: 16.h),
              const _ProfileItemOptionComponent(
                icon: Icons.star_outline,
                title: 'Beri Penilaian',
                subtitle: 'Beri Penilaian Anda Disini',
              ),
              SizedBox(height: 16.h),
              BlocBuilder<ProfileCubit, ProfileState>(
                builder: (_, state) {
                  if (state.asyncLogout.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: GetMeatColors.darkBlue,
                      ),
                    );
                  } else {
                    return _ProfileItemOptionComponent(
                      icon: Icons.exit_to_app_rounded,
                      title: 'Logout',
                      subtitle: 'Keluar Dari Akun Anda',
                      isLastItem: true,
                      onTap: () {
                        context.read<ProfileCubit>().logout();
                        Get.offAllNamed(GetMeatScreen.getStarted);
                      },
                    );
                  }
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
