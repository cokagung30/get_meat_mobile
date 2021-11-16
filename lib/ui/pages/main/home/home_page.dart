import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_meat_apps/data/preferences/auth_preferences.dart';
import 'package:get_meat_apps/injection.dart';
import 'package:get_meat_apps/model/models.dart';
import 'package:get_meat_apps/routes/get_meat_screen.dart';
import 'package:get_meat_apps/services/services.dart';
import 'package:get_meat_apps/shared/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_meat_apps/shared/text_style.dart';
import 'package:get_meat_apps/ui/pages/main/home/cubit/home_cubit.dart';
import 'package:get_meat_apps/ui/widget/widget.dart';
import 'package:intl/intl.dart';

part 'component/profile_user_component.dart';
part 'component/seller_list_component.dart';
part 'component/product_list_component.dart';

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
      child: Scaffold(
        body: Stack(
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
                  const _ProfileUserComponent(),
                  SizedBox(height: 30.h),
                  BlocBuilder<HomeCubit, HomeState>(
                    builder: (_, state) {
                      if (state.sellers.isSuccess && state.products.isSuccess) {
                        return Column(
                          children: [
                            _SellerListComponent(
                              sellers: state.sellers.data!.value!,
                            ),
                            // SizedBox(height: 30.h),
                            _ProductListComponent(
                              products: state.products.data!.value!,
                            ),
                          ],
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 1,
                            color: GetMeatColors.darkBlue,
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            )
          ],
        ),
        floatingActionButton: const GetMeatFloatingActionButtonWidget(),
      ),
    );
  }
}
