import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_meat_apps/model/models.dart';
import 'package:get_meat_apps/routes/get_meat_screen.dart';
import 'package:get_meat_apps/services/services.dart';
import 'package:get_meat_apps/shared/assets.dart';
import 'package:get_meat_apps/shared/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_meat_apps/shared/text_style.dart';
import 'package:get_meat_apps/ui/pages/seller_detail/cubit/seller_detail_cubit.dart';
import 'package:get_meat_apps/ui/widget/widget.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

part 'component/app_bar_detail_component.dart';
part 'component/product_item_component.dart';

class SellerDetailScreen extends StatefulWidget {
  const SellerDetailScreen({
    Key? key,
    required this.sellerId,
  }) : super(key: key);

  final int sellerId;

  @override
  _SellerDetailScreenState createState() => _SellerDetailScreenState();
}

class _SellerDetailScreenState extends State<SellerDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SellerDetailCubit(widget.sellerId),
      child: BlocBuilder<SellerDetailCubit, SellerDetailState>(
        builder: (_, state) {
          // context.read<SellerDetailCubit>().checkCart();
          return SafeArea(
            child: Scaffold(
              body: (state.asyncSeller.isSuccess &&
                      state.asyncProducts.isSuccess)
                  ? Column(
                      children: [
                        _AppBarDetailComponent(
                          seller: state.asyncSeller.data!,
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(20),
                        ),
                        (state.asyncProducts.data!.isEmpty)
                            ? Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Lottie.asset(
                                      GetMeatAssets.emptyData,
                                      width: 250,
                                      height: 250,
                                    ),
                                    SizedBox(
                                      height: ScreenUtil().setHeight(20),
                                    ),
                                    Text(
                                      'Tidak ada data produk',
                                      style: GetMeatTextStyle.blackFontStyle2,
                                    ),
                                  ],
                                ),
                              )
                            : Expanded(
                                child: ListView(
                                  children: [
                                    ...state.asyncProducts.data!.map(
                                      (product) => GestureDetector(
                                        onTap: () {
                                          Get.toNamed(
                                            GetMeatScreen.productDetail,
                                            arguments: {
                                              'id': product.id,
                                              'sellerId': widget.sellerId,
                                            },
                                          );
                                        },
                                        child: _ProductItemComponent(
                                          product: product,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                      ],
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
          );
        },
      ),
    );
  }
}
