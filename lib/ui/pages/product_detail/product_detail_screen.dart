import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_meat_apps/model/models.dart';
import 'package:get_meat_apps/routes/get_meat_screen.dart';
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
part 'component/add_cart_button_component.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({
    Key? key,
    required this.id,
    required this.sellerId,
  }) : super(key: key);

  final int id;
  final int sellerId;

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  Future<void> _onListener(
      ProductDetailState state, BuildContext context) async {
    if (state.asyncCart.isSuccess) {
      Get.toNamed(
        GetMeatScreen.payment,
        arguments: {
          'product': state.asyncProduct.data,
        },
      );
    } else if (state.isDiffSeller) {
      showDialog(
        context: context,
        builder: (_) => BlocProvider.value(
          value: BlocProvider.of<ProductDetailCubit>(context),
          child: GetMeatDialogWidget(
            title: 'Pesanan Berbeda',
            subtitle:
                'Tampaknya anda memilih pedagang berbeda dari sebelumnya, mau merubah pesanan anda?',
            positiveButton: GetMeatDialogButtonModel(
              label: 'Tidak',
              color: GetMeatColors.gray,
              onTap: () => Get.back(),
            ),
            negativeButton: GetMeatDialogButtonModel(
              label: 'Iya',
              color: GetMeatColors.gray,
              onTap: () {
                context.read<ProductDetailCubit>().removeAllCart();
                Get.back();
              },
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductDetailCubit>(
      create: (context) => ProductDetailCubit(widget.id, widget.sellerId),
      child: BlocListener<ProductDetailCubit, ProductDetailState>(
        listenWhen: (previous, current) {
          return previous.isDiffSeller != current.isDiffSeller ||
              previous.asyncCart != current.asyncCart;
        },
        listener: (_, state) => _onListener(state, _),
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
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          _ImageProductComponent(
                            productPic:
                                state.asyncProduct.data?.photoProduct ?? '',
                          ),
                          _ProductInformationComponent(
                            product: product,
                          ),
                          BlocBuilder<ProductDetailCubit, ProductDetailState>(
                            builder: (context, state) {
                              TextEditingController _quantityController =
                                  TextEditingController();
                              return _ManagementQuantityComponent(
                                quantity: state.quantity,
                                controller: _quantityController,
                                unitSelected: state.unit,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SafeArea(
                        child:
                            BlocBuilder<ProductDetailCubit, ProductDetailState>(
                          builder: (_, state) {
                            return _AddCartButtonComponent(
                              product: product,
                              isValid: state.validated,
                            );
                          },
                        ),
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
      ),
    );
  }

  // Widget _buildDivider() {
  //   return Container(
  //     width: double.infinity,
  //     height: 0.5.h,
  //     color: GetMeatColors.lightGray.withOpacity(0.2),
  //   );
  // }
}
