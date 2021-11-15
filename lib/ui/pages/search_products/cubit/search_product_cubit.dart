import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:get_meat_apps/data/async_state.dart';
import 'package:get_meat_apps/model/models.dart';
import 'package:get_meat_apps/services/services.dart';

part 'search_product_state.dart';

class SearchProductCubit extends Cubit<SearchProductState> {
  SearchProductCubit() : super(const SearchProductState()) {
    loadProduct();
  }

  void searchProduct(String keyword) {
    emit(state.copyWith(query: keyword));
  }

  void loadProduct() async {
    emit(state.copyWith(products: const AsyncState.loading()));

    try {
      final products =
          await ProductServices.fetchProducts(productName: state.query);
      emit(state.copyWith(products: AsyncState.success(products.value)));
    } catch (e) {
      if (e is DioError) {
        emit(state.copyWith(products: AsyncState.error(e)));
      }
    }
  }
}
