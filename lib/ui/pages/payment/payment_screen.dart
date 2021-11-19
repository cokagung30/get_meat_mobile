import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_meat_apps/data/local/models/cart.dart';
import 'package:get_meat_apps/model/models.dart';
import 'package:get_meat_apps/services/services.dart';
import 'package:get_meat_apps/shared/colors.dart';
import 'package:get_meat_apps/shared/text_style.dart';
import 'package:get_meat_apps/ui/pages/payment/cubit/payment_cubit.dart';
import 'package:get_meat_apps/ui/widget/widget.dart';
import 'package:intl/intl.dart';

part 'component/header_component.dart';
part 'component/item_order_component.dart';
part 'component/order_by_component.dart';
part 'component/checkout_button_component.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PaymentCubit(
        sellerCity: widget.product.seller.city.cityId,
        productId: widget.product.id,
      ),
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
                                state.asyncCostPayment.data?.value?.value ?? 0,
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          _OrderByComponent(user: state.asyncUser.data?.value),
                          SizedBox(
                            height: 24.h,
                          ),
                          const _CheckoutButtonComponent(),
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
    );
  }
}
