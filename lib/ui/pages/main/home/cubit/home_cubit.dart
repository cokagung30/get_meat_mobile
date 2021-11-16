import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:get_meat_apps/data/async_state.dart';
import 'package:get_meat_apps/data/local/services/cart_local_services.dart';

import 'package:get_meat_apps/model/models.dart';
import 'package:get_meat_apps/services/services.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState()) {
    // checkCart();
    fetchSeller();
    fetchProduct();
  }

  void fetchSeller() async {
    emit(state.copyWith(sellers: const AsyncState.loading()));

    try {
      var result = await SellerServices.fetchSeller(limit: 5);
      emit(state.copyWith(sellers: AsyncState.success(result)));
    } catch (e) {
      if (e is DioError) {
        emit(state.copyWith(sellers: AsyncState.error(e)));
      }
    }
  }

  void fetchProduct() async {
    emit(state.copyWith(products: const AsyncState.loading()));

    try {
      var result = await ProductServices.fetchProducts(limit: 10);
      emit(state.copyWith(products: AsyncState.success(result)));
    } catch (e) {
      if (e is DioError) {
        emit(state.copyWith(products: AsyncState.error(e)));
      }
    }
  }

  void checkCart() async {
    final CartLocalServices _cartLocalServices = CartLocalServices();
    int cartCount = await _cartLocalServices.checkProduct(null);

    emit(state.copyWith(cartCount: cartCount));
  }
}
