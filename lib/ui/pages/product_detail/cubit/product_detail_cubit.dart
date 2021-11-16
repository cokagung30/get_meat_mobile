import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:get_meat_apps/data/async_state.dart';
import 'package:get_meat_apps/model/models.dart';
import 'package:get_meat_apps/services/services.dart';

part 'product_detail_state.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  ProductDetailCubit(this.id) : super(const ProductDetailState()) {
    loadProductDetail();
  }

  final int id;

  void addQty() {
    if (state.quantity < state.asyncProduct.data!.stock) {
      emit(state.copyWith(quantity: state.quantity + 1));
    }
  }

  void minQty() {
    if (state.quantity > 1) {
      emit(state.copyWith(quantity: state.quantity - 1));
    }
  }

  void loadProductDetail() async {
    emit(state.copyWith(asyncProduct: const AsyncState.loading()));
    try {
      final product = await ProductServices.fetchDetailProduct(productId: id);
      emit(state.copyWith(asyncProduct: AsyncState.success(product.value)));
    } catch (e) {
      if (e is DioError) {
        emit(state.copyWith(asyncProduct: AsyncState.error(e)));
      }
    }
  }
}
