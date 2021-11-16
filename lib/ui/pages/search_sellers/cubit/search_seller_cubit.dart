import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:get_meat_apps/data/async_state.dart';
import 'package:get_meat_apps/model/models.dart';
import 'package:get_meat_apps/services/services.dart';

part 'search_seller_state.dart';

class SearchSellerCubit extends Cubit<SearchSellerState> {
  SearchSellerCubit() : super(const SearchSellerState()) {
    loadSeller();
  }

  void searchSeller(String keyword) {
    emit(state.copyWith(query: keyword));
  }

  void loadSeller() async {
    emit(state.copyWith(sellers: const AsyncState.loading()));

    try {
      final result = await SellerServices.fetchSeller(sellerName: state.query);
      emit(state.copyWith(sellers: AsyncState.success(result.value)));
    } catch (e) {
      if (e is DioError) {
        emit(state.copyWith(sellers: AsyncState.error(e)));
      }
    }
  }
}
