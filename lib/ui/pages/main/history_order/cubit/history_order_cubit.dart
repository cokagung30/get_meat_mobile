import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:get_meat_apps/data/async_state.dart';
import 'package:get_meat_apps/data/local/models/cart.dart';
import 'package:get_meat_apps/data/local/services/cart_local_services.dart';
import 'package:get_meat_apps/model/models.dart';
import 'package:get_meat_apps/services/services.dart';

part 'history_order_state.dart';

class HistoryOrderCubit extends Cubit<HistoryOrderState> {
  HistoryOrderCubit() : super(const HistoryOrderState()) {
    loadCart();
    loadOrders();
  }

  final CartLocalServices _cartLocalServices = CartLocalServices();

  void selectedPage(int index) {
    emit(state.copyWith(selectedIndex: index));
  }

  void loadCart() async {
    emit(state.copyWith(asyncCart: const AsyncState.loading()));

    try {
      final carts = await _cartLocalServices.getAllCart();
      print("Keranjang: $carts");
      emit(state.copyWith(asyncCart: AsyncState.success(carts)));
    } catch (e) {
      if (e is DioError) {
        emit(state.copyWith(asyncCart: AsyncState.error(e)));
      }
    }
  }

  void loadOrders() async {
    emit(state.copyWith(asyncOrder: const AsyncState.loading()));

    try {
      final orders = await OrderServices.fetchOrders();

      emit(state.copyWith(asyncOrder: AsyncState.success(orders.value)));
    } catch (e) {
      if (e is DioError) {
        emit(state.copyWith(asyncOrder: AsyncState.error(e)));
      }
    }
  }
}
