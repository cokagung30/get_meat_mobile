part of 'seller_detail_cubit.dart';

class SellerDetailState extends Equatable {
  const SellerDetailState({
    this.asyncSeller = const AsyncState.uninitialized(),
    this.asyncProducts = const AsyncState.uninitialized(),
  });

  final AsyncState<Seller> asyncSeller;
  final AsyncState<List<Product>> asyncProducts;

  SellerDetailState copyWith(
      {AsyncState<Seller>? asyncSeller,
      AsyncState<List<Product>>? asyncProducts}) {
    return SellerDetailState(
      asyncSeller: asyncSeller ?? this.asyncSeller,
      asyncProducts: asyncProducts ?? this.asyncProducts,
    );
  }

  @override
  List<Object> get props => [asyncSeller];
}
