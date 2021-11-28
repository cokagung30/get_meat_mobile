import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:get_meat_apps/data/async_state.dart';
import 'package:get_meat_apps/data/local/models/cart.dart';
import 'package:get_meat_apps/data/local/services/cart_local_services.dart';
import 'package:get_meat_apps/data/preferences/auth_preferences.dart';
import 'package:get_meat_apps/injection.dart';
import 'package:get_meat_apps/model/models.dart';
import 'package:get_meat_apps/model/request/order_request.dart';
import 'package:get_meat_apps/services/services.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit({
    required this.sellerCity,
    required this.productId,
  }) : super(const PaymentState()) {
    getCost(sellerCity, productId);
    getUser();
  }

  final int sellerCity;
  final int productId;

  final CartLocalServices _cartLocalServices = CartLocalServices();

  Future<void> getCost(int sellerCity, int productId) async {
    emit(state.copyWith(asyncCostPayment: const AsyncState.loading()));

    try {
      String? cityId = locator<AuthPreferences>().getCityId();
      Cart? cart = await _cartLocalServices.getCartProduct(productId);

      if (cart != null) {
        double totalWeight = 0.0;

        if (cart.unit == 'kilo' ||
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

        emit(
          state.copyWith(
            asyncCostPayment: AsyncState.success(response),
            asyncCart: AsyncState.success(cart),
          ),
        );
      }
    } catch (e) {
      if (e is DioError) {
        emit(state.copyWith(asyncCostPayment: AsyncState.error(e)));
      }
    }
  }

  void getUser() async {
    emit(state.copyWith(asyncUser: const AsyncState.loading()));

    try {
      var userResponse = await CustomerService.fetchUser();

      emit(state.copyWith(
        asyncUser: AsyncState.success(userResponse),
      ));
    } catch (e) {
      print(e);
      if (e is DioError) {
        emit(state.copyWith(asyncUser: AsyncState.error(e)));
      }
    }
  }

  void checkout(String paymentType) async {
    emit(state.copyWith(asyncOrder: const AsyncState.loading()));
    var userId = locator<AuthPreferences>().getCustomerId();
    var costAmount = state.asyncCostPayment.data?.value?.value ?? 0;

    try {
      Cart? cart = await _cartLocalServices.getCartProduct(productId);
      var response = await OrderServices.createOrder(OrderRequest(
        sellerId: cart?.sellerId ?? 0,
        productId: cart?.productId ?? 0,
        quantity: cart?.quantity ?? 0,
        customerId: int.parse(userId ?? '0'),
        totalPayment: (cart?.quantity ?? 0) * (cart?.productPrice ?? 0),
        sendCost: (costAmount - (costAmount * (10 / 100))).toInt(),
        orderAddress: state.asyncUser.data?.value?.customerAddress ?? '',
        paymentType: paymentType,
      ));

      await _cartLocalServices.deleteAll();

      emit(
        state.copyWith(
          asyncOrder: AsyncState.success(response),
        ),
      );
    } catch (e) {
      print(e);
      if (e is DioError) {
        emit(state.copyWith(asyncOrder: AsyncState.error(e)));
      }
    }
  }
}
