import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:get_meat_apps/data/async_state.dart';
import 'package:get_meat_apps/data/local/models/cart.dart';
import 'package:get_meat_apps/data/local/services/cart_local_services.dart';
import 'package:get_meat_apps/data/preferences/auth_preferences.dart';
import 'package:get_meat_apps/injection.dart';
import 'package:get_meat_apps/model/models.dart';
import 'package:get_meat_apps/services/services.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit({
    required this.sellerCity,
    required this.productId,
  }) : super(const PaymentState()) {
    getCost(sellerCity, productId);
  }

  final int sellerCity;
  final int productId;

  final CartLocalServices _cartLocalServices = CartLocalServices();

  void getCost(int sellerCity, int productId) async {
    emit(state.copyWith(asyncCostPayment: const AsyncState.loading()));
    String? cityId = locator<AuthPreferences>().getCityId();

    try {
      Cart? cart = await _cartLocalServices.getCartProduct(productId);
      double totalWeight = 0.0;

      if (cart!.unit == 'kilo' ||
          cart.unit == 'kilogram' ||
          cart.unit == 'kg') {
        totalWeight = cart.quantity * 1000;
      } else {
        totalWeight = cart.quantity.toDouble();
      }

      var response = await OrderServices.getCost(
        sellerCity: sellerCity,
        totalWeight: totalWeight,
        destination: int.parse(
          cityId.toString(),
        ),
      );

      var userResponse = await CustomerService.fetchUser();

      emit(
        state.copyWith(
          asyncCostPayment: AsyncState.success(response),
          asyncCart: AsyncState.success(cart),
          asyncUser: AsyncState.success(userResponse),
        ),
      );
    } catch (e) {
      if (e is DioError) {
        emit(state.copyWith(asyncCostPayment: AsyncState.error(e)));
      }
    }
  }
}
