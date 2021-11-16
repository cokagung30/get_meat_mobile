import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_meat_apps/model/models.dart';
import 'package:get_meat_apps/services/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_meat_apps/shared/colors.dart';
import 'package:get_meat_apps/shared/text_style.dart';
import 'package:get_meat_apps/ui/base/custom_view_with_toolbar.dart';
import 'package:get_meat_apps/ui/pages/product_detail/cubit/product_detail_cubit.dart';
import 'package:get_meat_apps/ui/widget/widget.dart';
import 'package:intl/intl.dart';

part 'component/product_information_component.dart';
part 'component/note_order_component.dart';
part 'component/image_product_component.dart';
part 'component/management_quantity_component.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductDetailCubit(widget.id),
      child: CustomViewWithToolbar(
        title: 'Detail Produk',
        leadingIcon: Icons.arrow_back_ios,
        onLeadingIconTap: () => Get.back(),
        body: BlocBuilder<ProductDetailCubit, ProductDetailState>(
          builder: (_, state) {
            if (state.asyncProduct.isSuccess) {
              var product = state.asyncProduct.data;
              return Stack(
                children: [
                  ListView(
                    shrinkWrap: true,
                    children: [
                      _ImageProductComponent(
                        productPic: state.asyncProduct.data?.photoProduct ?? '',
                      ),
                      _ProductInformationComponent(
                        product: product,
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16.w),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Catatan untuk pedagang ',
                                style:
                                    GetMeatTextStyle.blackFontStyle2.copyWith(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: ' Tidak Wajib',
                                style:
                                    GetMeatTextStyle.blackFontStyle2.copyWith(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      _buildDivider(),
                      const _NoteOrderComponent(),
                      _buildDivider(),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                      ),
                      BlocBuilder<ProductDetailCubit, ProductDetailState>(
                          builder: (_, state) {
                        return _ManagementQuantityComponent(
                          quantity: state.quantity,
                        );
                      }),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SafeArea(
                      child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(16.w),
                          child: GetMeatButton(
                            label: 'Tambah ke Keranjang ',
                            width: double.infinity,
                            height: 40.h,
                            buttonColor: GetMeatColors.darkBlue,
                            style: GetMeatTextStyle.whiteFontStyle1.copyWith(
                              fontSize: 16.sp,
                            ),
                            onPress: () {},
                          )),
                    ),
                  ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      width: double.infinity,
      height: 0.5.h,
      color: GetMeatColors.lightGray.withOpacity(0.2),
    );
  }
}
