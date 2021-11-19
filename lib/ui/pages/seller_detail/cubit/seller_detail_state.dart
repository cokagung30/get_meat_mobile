part of 'seller_detail_cubit.dart';

class SellerDetailState extends Equatable {
  const SellerDetailState({
    this.asyncSeller = const AsyncState.uninitialized(),
    this.asyncProducts = const AsyncState.uninitialized(),
    this.cartCount = 0,
  });

  final AsyncState<Seller> asyncSeller;
  final AsyncState<List<Product>> asyncProducts;
  final int cartCount;

  SellerDetailState copyWith({
    AsyncState<Seller>? asyncSeller,
    AsyncState<List<Product>>? asyncProducts,
    int? cartCount,
  }) {
    return SellerDetailState(
      asyncSeller: asyncSeller ?? this.asyncSeller,
      asyncProducts: asyncProducts ?? this.asyncProducts,
      cartCount: cartCount ?? this.cartCount,
    );
  }

  @override
  List<Object> get props => [asyncSeller];
}
