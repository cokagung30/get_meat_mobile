import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:get_meat_apps/data/async_state.dart';
import 'package:get_meat_apps/model/models.dart';
import 'package:get_meat_apps/services/services.dart';

part 'seller_detail_state.dart';

class SellerDetailCubit extends Cubit<SellerDetailState> {
  SellerDetailCubit(this.sellerId) : super(const SellerDetailState()) {
    loadSellerDetail(sellerId);
  }

  final int sellerId;

  void loadSellerDetail(int sellerId) async {
    emit(state.copyWith(asyncSeller: const AsyncState.loading()));

    try {
      var resultSeller =
          await SellerServices.fetchDetailSeller(sellerId: sellerId);
      var resultProduct =
          await ProductServices.fetchProducts(sellerId: sellerId);

      emit(
        state.copyWith(
          asyncSeller: AsyncState.success(resultSeller.value),
          asyncProducts: AsyncState.success(resultProduct.value),
        ),
      );
    } catch (e) {
      if (e is DioError) {
        emit(state.copyWith(asyncSeller: AsyncState.error(e)));
      }
    }
  }
}
