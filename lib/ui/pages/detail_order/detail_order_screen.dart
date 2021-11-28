import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:get_meat_apps/model/models.dart';
import 'package:get_meat_apps/routes/get_meat_screen.dart';
import 'package:get_meat_apps/services/services.dart';
import 'package:get_meat_apps/shared/assets.dart';
import 'package:get_meat_apps/shared/colors.dart';
import 'package:get_meat_apps/shared/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_meat_apps/ui/pages/detail_order/cubit/detail_order_cubit.dart';
import 'package:get_meat_apps/ui/widget/widget.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

part 'component/header_component.dart';
part 'component/item_order_component.dart';
part 'component/order_detail_component.dart';
part 'component/status_order_component.dart';
part 'component/photo_proof_transfer.dart';
part 'component/finish_type_option.dart';

class DetailOrderScreen extends StatefulWidget {
  const DetailOrderScreen({Key? key, required this.order}) : super(key: key);

  final Order order;

  @override
  _DetailOrderScreenState createState() => _DetailOrderScreenState();
}

class _DetailOrderScreenState extends State<DetailOrderScreen> {
  @override
  void initState() {
    super.initState();
    initializeDateFormatting('id_ID', null);
  }

  Future<void> _onListener(DetailOrderState state) async {
    if (state.asyncCancelOrder.isLoading || state.asyncFinishOrder.isLoading) {
      showDialogLoading(context);
    } else if (state.asyncCancelOrder.isSuccess) {
      Get.offAllNamed(GetMeatScreen.main);
    } else if (state.asyncFinishOrder.isSuccess) {
      showDialog(
        context: context,
        builder: (_) {
          return GetMeatDialogWidget(
            title: 'Pesanan Diselesaikan',
            subtitle: 'Pesanan berhasil diselesaikan !!',
            asset: GetMeatAssets.checkCircle,
            positiveButton: GetMeatDialogButtonModel(
              label: 'OK',
              color: GetMeatColors.green,
              onTap: () {
                Get.offNamed(GetMeatScreen.main);
              },
            ),
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (_) {
          return const GetMeatDialogWidget(
            title: 'Pembatalan Pesanan',
            subtitle: 'Pembatalan pesanan batal !!',
            asset: GetMeatAssets.crossCircle,
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailOrderCubit>(
      create: (contexts) => DetailOrderCubit(),
      child: BlocListener<DetailOrderCubit, DetailOrderState>(
          listenWhen: (prev, next) =>
              prev.asyncCancelOrder != next.asyncCancelOrder ||
              prev.asyncFinishOrder != next.asyncFinishOrder,
          listener: (_, state) => _onListener(state),
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
                        (widget.order.orderStatus != "1")
                            ? Column(
                                children: [
                                  _StatusOrderComponent(
                                      orderStatus: widget.order.orderStatus),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                ],
                              )
                            : Container(),
                        _ItemOrderComponent(order: widget.order),
                        SizedBox(
                          height: 24.h,
                        ),
                        _OrderDetailComponent(order: widget.order),
                        SizedBox(
                          height: 24.h,
                        ),
                        (widget.order.typePayment != "Payment Gateway" &&
                                widget.order.orderStatus != "1")
                            ? _PhotoProofTransfer(
                                photoProofTransfer:
                                    widget.order.photoProofPayment ?? "",
                              )
                            : Container(),
                        SizedBox(
                          height: 15.h,
                        ),
                        (widget.order.orderStatus == "1")
                            ? Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(16.w),
                                child: GetMeatButton(
                                  label: 'Bayar Sekarang ',
                                  width: double.infinity,
                                  height: 50.h,
                                  buttonColor: GetMeatColors.darkBlue,
                                  style:
                                      GetMeatTextStyle.whiteFontStyle1.copyWith(
                                    fontSize: 16.sp,
                                  ),
                                  onPress: () {
                                    (widget.order.typePayment ==
                                            "Payment Gateway")
                                        ? Get.toNamed(
                                            GetMeatScreen.orderSuccess,
                                            arguments: {
                                              'url': widget.order.paymentUrl,
                                            },
                                          )
                                        : Get.toNamed(
                                            GetMeatScreen.transferBank,
                                            arguments: {'order': widget.order},
                                          );
                                  },
                                ),
                              )
                            : (widget.order.orderStatus == "3")
                                ? BlocBuilder<DetailOrderCubit,
                                    DetailOrderState>(builder: (_, state) {
                                    return Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.all(16.w),
                                      child: GetMeatButton(
                                        label: 'Pesanan Sudah Diterma',
                                        width: double.infinity,
                                        height: 50.h,
                                        buttonColor: GetMeatColors.lightBlue,
                                        style: GetMeatTextStyle.whiteFontStyle1
                                            .copyWith(
                                          fontSize: 16.sp,
                                        ),
                                        onPress: () {
                                          _showPicker(_);
                                        },
                                      ),
                                    );
                                  })
                                : Container(),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(
                            left: 16.w,
                            right: 16.w,
                            bottom: 16.w,
                          ),
                          child: GetMeatButton(
                            label: 'Hubungi Penjual',
                            width: double.infinity,
                            height: 50.h,
                            buttonColor: GetMeatColors.green,
                            style: GetMeatTextStyle.whiteFontStyle1.copyWith(
                              fontSize: 16.sp,
                            ),
                            onPress: () async {
                              String url = (Platform.isAndroid)
                                  ? "https://wa.me/${widget.order.product.seller.whatsappNumber.replaceRange(0, 1, '+62')}"
                                  : "https://api.whatsapp.com/send?phone=${widget.order.product.seller.whatsappNumber.replaceRange(0, 1, '+62')}";
                              await launch(url);
                            },
                          ),
                        ),
                        (widget.order.orderStatus == "1")
                            ? BlocBuilder<DetailOrderCubit, DetailOrderState>(
                                builder: (context, state) {
                                return Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.only(
                                    left: 16.w,
                                    right: 16.w,
                                    bottom: 16.w,
                                  ),
                                  child: GetMeatButton(
                                    label: 'Batalkan Pesanan',
                                    width: double.infinity,
                                    height: 50.h,
                                    buttonColor: GetMeatColors.red,
                                    style: GetMeatTextStyle.whiteFontStyle1
                                        .copyWith(
                                      fontSize: 16.sp,
                                    ),
                                    onPress: () {
                                      context
                                          .read<DetailOrderCubit>()
                                          .cancelOrder(widget.order.id);
                                    },
                                  ),
                                );
                              })
                            : Container()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  void _showPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => BlocProvider.value(
          value: BlocProvider.of<DetailOrderCubit>(context),
          child: BlocListener<DetailOrderCubit, DetailOrderState>(
            listenWhen: (prev, curr) =>
                prev.asyncFinishOrder != curr.asyncFinishOrder,
            listener: (_, state) {},
            child: SafeArea(
              child: _FinishTypeOption(
                onTapFinishOrder: () {
                  context.read<DetailOrderCubit>().finishOrder(widget.order.id);
                },
                onTapToUploadSendedProof: () {
                  Get.toNamed(GetMeatScreen.orderFinish, arguments: {
                    'order': widget.order,
                  });
                },
              ),
            ),
          )),
    );
  }
}
