part of 'payment_cubit.dart';

class PaymentState extends Equatable {
  const PaymentState({
    this.asyncCostPayment = const AsyncState.uninitialized(),
    this.asyncCart = const AsyncState.uninitialized(),
    this.asyncUser = const AsyncState.uninitialized(),
    this.asyncOrder = const AsyncState.uninitialized(),
  });

  final AsyncState<ApiReturnValue<CostPayment>> asyncCostPayment;
  final AsyncState<Cart> asyncCart;
  final AsyncState<ApiReturnValue<User>> asyncUser;
  final AsyncState<ApiReturnValue<Order>> asyncOrder;

  PaymentState copyWith({
    AsyncState<ApiReturnValue<CostPayment>>? asyncCostPayment,
    AsyncState<Cart>? asyncCart,
    AsyncState<ApiReturnValue<User>>? asyncUser,
    AsyncState<ApiReturnValue<Order>>? asyncOrder,
  }) {
    return PaymentState(
      asyncCostPayment: asyncCostPayment ?? this.asyncCostPayment,
      asyncCart: asyncCart ?? this.asyncCart,
      asyncUser: asyncUser ?? this.asyncUser,
      asyncOrder: asyncOrder ?? this.asyncOrder,
    );
  }

  @override
  List<Object> get props => [
        asyncCostPayment,
        asyncCart,
        asyncOrder,
        asyncUser,
      ];
}
