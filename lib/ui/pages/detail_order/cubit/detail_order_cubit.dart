import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:get_meat_apps/data/async_state.dart';
import 'package:get_meat_apps/services/services.dart';

part 'detail_order_state.dart';

class DetailOrderCubit extends Cubit<DetailOrderState> {
  DetailOrderCubit() : super(const DetailOrderState());

  void cancelOrder(int id) async {
    emit(state.copyWith(asyncCancelOrder: const AsyncState.loading()));

    try {
      final response = await OrderServices.cancelOrder(orderId: id);

      emit(state.copyWith(
        asyncCancelOrder: AsyncState.success(response.value),
      ));
    } catch (e) {
      if (e is DioError) {
        emit(state.copyWith(asyncCancelOrder: AsyncState.error(e)));
      }
    }
  }

  void finishOrder(int id) async {
    emit(state.copyWith(asyncFinishOrder: const AsyncState.loading()));

    try {
      final response = await OrderServices.finishOrder(orderId: id);
      emit(
          state.copyWith(asyncFinishOrder: AsyncState.success(response.value)));
    } catch (e) {
      if (e is DioError) {
        emit(state.copyWith(asyncFinishOrder: AsyncState.error(e)));
      }
    }
  }
}
