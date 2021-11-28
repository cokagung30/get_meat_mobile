part of 'detail_order_cubit.dart';

class DetailOrderState extends Equatable {
  const DetailOrderState({
    this.asyncCancelOrder = const AsyncState.uninitialized(),
    this.asyncFinishOrder = const AsyncState.uninitialized(),
  });

  final AsyncState<bool> asyncCancelOrder;
  final AsyncState<bool> asyncFinishOrder;

  DetailOrderState copyWith({
    AsyncState<bool>? asyncCancelOrder,
    AsyncState<bool>? asyncFinishOrder,
  }) {
    return DetailOrderState(
      asyncCancelOrder: asyncCancelOrder ?? this.asyncCancelOrder,
      asyncFinishOrder: asyncFinishOrder ?? this.asyncFinishOrder,
    );
  }

  @override
  List<Object> get props => [
        asyncCancelOrder,
        asyncFinishOrder,
      ];
}
