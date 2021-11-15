import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_meat_apps/data/preferences/auth_preferences.dart';
import 'package:get_meat_apps/injection.dart';
import 'package:get_meat_apps/services/services.dart';
import 'package:get_meat_apps/shared/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_meat_apps/shared/text_style.dart';
import 'package:get_meat_apps/ui/pages/main/home/cubit/home_cubit.dart';
import 'package:get_meat_apps/ui/widget/widget.dart';

part 'component/profile_user_component.dart';
part 'component/seller_list_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: Stack(
        children: [
          Container(
            color: GetMeatColors.darkBlue,
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: ListView(
              children: [
                const _ProfileUserComponent(),
                SizedBox(height: 30.h),
                const _SellerListComponent(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
