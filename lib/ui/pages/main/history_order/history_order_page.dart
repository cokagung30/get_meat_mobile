import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_meat_apps/data/local/models/cart.dart';
import 'package:get_meat_apps/model/models.dart';
import 'package:get_meat_apps/routes/get_meat_screen.dart';
import 'package:get_meat_apps/services/services.dart';
import 'package:get_meat_apps/shared/assets.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:get_meat_apps/shared/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_meat_apps/shared/text_style.dart';
import 'package:get_meat_apps/ui/pages/main/history_order/cubit/history_order_cubit.dart';
import 'package:get_meat_apps/ui/widget/widget.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

part 'component/header_component.dart';
part 'component/status_order_component.dart';
part 'component/order_items_component.dart';
part 'component/empty_order_component.dart';

class HistoryOrderPage extends StatefulWidget {
  const HistoryOrderPage({Key? key}) : super(key: key);

  @override
  _HistoryOrderPageState createState() => _HistoryOrderPageState();
}

class _HistoryOrderPageState extends State<HistoryOrderPage> {
  @override
  void initState() {
    super.initState();
    initializeDateFormatting('id_ID', null);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HistoryOrderCubit>(
      create: (_) => HistoryOrderCubit(),
      child: Stack(
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
            child: Column(
              children: [
                const _HeaderComponent(),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  height: 30.h,
                  child: BlocBuilder<HistoryOrderCubit, HistoryOrderState>(
                      builder: (_, state) {
                    return _StatusOrderComponent(
                      selectedIndex: state.selectedIndex,
                    );
                  }),
                ),
                SizedBox(
                  height: 15.h,
                ),
                BlocBuilder<HistoryOrderCubit, HistoryOrderState>(
                    builder: (_, state) {
                  if (state.asyncCart.isSuccess && state.asyncOrder.isSuccess) {
                    return Expanded(
                      child: Builder(builder: (context) {
                        if (state.selectedIndex == 0) {
                          if (state.asyncCart.data!.isNotEmpty) {
                            return _OrderItemsComponent(
                              carts: state.asyncCart.data,
                            );
                          } else {
                            return const _EmptyOrderComponent();
                          }
                        } else {
                          List<Order>? orders = state.asyncOrder.data
                              ?.where((element) => (element.orderStatus ==
                                  ((state.selectedIndex == 1)
                                      ? "1"
                                      : (state.selectedIndex == 2)
                                          ? "2"
                                          : (state.selectedIndex == 3)
                                              ? "3"
                                              : "4")))
                              .toList();
                          if (orders!.isNotEmpty) {
                            return _OrderItemsComponent(orders: orders);
                          } else {
                            return const _EmptyOrderComponent();
                          }
                        }
                      }),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 1,
                      ),
                    );
                  }
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
