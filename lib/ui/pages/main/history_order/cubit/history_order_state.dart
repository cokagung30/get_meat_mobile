part of 'history_order_cubit.dart';

class HistoryOrderState extends Equatable {
  const HistoryOrderState({
    this.selectedIndex = 0,
    this.asyncOrder = const AsyncState.uninitialized(),
    this.asyncCart = const AsyncState.uninitialized(),
  });

  final int selectedIndex;
  final AsyncState<List<Order>> asyncOrder;
  final AsyncState<List<Cart>> asyncCart;

  HistoryOrderState copyWith({
    int? selectedIndex,
    AsyncState<List<Order>>? asyncOrder,
    AsyncState<List<Cart>>? asyncCart,
  }) {
    return HistoryOrderState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      asyncOrder: asyncOrder ?? this.asyncOrder,
      asyncCart: asyncCart ?? this.asyncCart,
    );
  }

  @override
  List<Object> get props => [
        selectedIndex,
        asyncCart,
        asyncOrder,
      ];
}
