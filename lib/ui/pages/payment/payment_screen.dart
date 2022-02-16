import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_meat_apps/data/local/models/cart.dart';
import 'package:get_meat_apps/model/models.dart';
import 'package:get_meat_apps/routes/get_meat_screen.dart';
import 'package:get_meat_apps/services/services.dart';
import 'package:get_meat_apps/shared/assets.dart';
import 'package:get_meat_apps/shared/colors.dart';
import 'package:get_meat_apps/shared/text_style.dart';
import 'package:get_meat_apps/ui/pages/payment/cubit/payment_cubit.dart';
import 'package:get_meat_apps/ui/widget/widget.dart';
import 'package:intl/intl.dart';

part 'component/header_component.dart';
part 'component/item_order_component.dart';
part 'component/order_by_component.dart';
part 'component/checkout_button_component.dart';
part 'component/payment_type_option.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  Future<void> _onSendingOrder(PaymentState state) async {
    Get.back();
    if (state.asyncOrder.isSuccess) {
      if (state.asyncOrder.data!.isSuccess != false) {
        if (state.asyncOrder.data!.value!.typePayment == 'Transfer Bank') {
          Get.offAllNamed(GetMeatScreen.transferBank, arguments: {
            'order': state.asyncOrder.data!.value!,
          });
        } else if (state.asyncOrder.data!.value!.typePayment == 'COD') {
          showDialog(
              context: context,
              builder: (_) {
                return GetMeatDialogWidget(
                  subtitle: 'Pesananmu sudah kami sampaikan ke pedagang !',
                  asset: GetMeatAssets.checkCircle,
                  positiveButton: GetMeatDialogButtonModel(
                    color: GetMeatColors.green,
                    label: 'OK',
                    onTap: () {
                      Get.offAllNamed(GetMeatScreen.main);
                    },
                  ),
                );
              });
        } else {
          Get.offAllNamed(GetMeatScreen.orderSuccess, arguments: {
            'url': state.asyncOrder.data!.value!.paymentUrl ?? '',
          });
        }
      } else {
        showDialog(
            context: context,
            builder: (_) {
              return GetMeatDialogWidget(
                title: 'Pemesanan Gagal',
                subtitle: state.asyncOrder.data!.message!,
                asset: GetMeatAssets.crossCircle,
              );
            });
      }
    } else if (state.asyncOrder.isError) {
      if (state.asyncOrder.data!.isAuth! == false) {
        showDialog(
            context: context,
            builder: (_) {
              return const GetMeatDialogWidget(
                title: 'Sesi Habis',
                subtitle: 'Sesi habis, silahkan login ulang kembali',
                asset: GetMeatAssets.crossCircle,
              );
            });
      } else {
        showDialog(
            context: context,
            builder: (_) {
              return const GetMeatDialogWidget(
                title: 'Pemesanan Gagal',
                subtitle: 'Pesanan yang anda lakukan gagal, silahkan coba lagi',
                asset: GetMeatAssets.crossCircle,
              );
            });
      }
    } else {
      showDialogLoading(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PaymentCubit(
        sellerCity: widget.product.seller.city.cityId,
        productId: widget.product.id,
      ),
      child: BlocListener<PaymentCubit, PaymentState>(
        listenWhen: (prev, next) {
          return prev.asyncOrder != next.asyncOrder;
        },
        listener: (_, state) => _onSendingOrder(state),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white70,
            body: BlocBuilder<PaymentCubit, PaymentState>(
              builder: (_, state) {
                if (state.asyncCostPayment.isSuccess &&
                    state.asyncUser.isSuccess) {
                  return Column(
                    children: [
                      const _HeaderComponent(),
                      Expanded(
                        child: ListView(
                          children: [
                            SizedBox(
                              height: 24.h,
                            ),
                            _ItemOrderComponent(
                              cart: state.asyncCart.data,
                              costAmount:
                                  state.asyncCostPayment.data?.value?.value ??
                                      0,
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                            _OrderByComponent(
                                user: state.asyncUser.data?.value),
                            SizedBox(
                              height: 24.h,
                            ),
                            _CheckoutButtonComponent(
                              onTap: () => _showPicker(_),
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  void _showPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => BlocProvider.value(
          value: BlocProvider.of<PaymentCubit>(context),
          child: BlocListener<PaymentCubit, PaymentState>(
            listenWhen: (prev, curr) => prev.asyncOrder != curr.asyncOrder,
            listener: (_, state) => _onSendingOrder(state),
            child: SafeArea(
              child: _PaymentTypeOption(
                onTapPaymentGateway: () {
                  context.read<PaymentCubit>().checkout('Payment Gateway');
                },
                onTapTransferBank: () {
                  context.read<PaymentCubit>().checkout('Transfer Bank');
                },
                onTapCOD: () {
                  context.read<PaymentCubit>().checkout('COD');
                },
              ),
            ),
          )),
    );
  }
}
