part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    this.sellers = const AsyncState.uninitialized(),
    this.products = const AsyncState.uninitialized(),
    this.cartCount = 0,
  });

  final AsyncState<ApiReturnValue<List<Seller>>> sellers;
  final AsyncState<ApiReturnValue<List<Product>>> products;
  final int cartCount;

  HomeState copyWith({
    AsyncState<ApiReturnValue<List<Seller>>>? sellers,
    AsyncState<ApiReturnValue<List<Product>>>? products,
    int? cartCount,
  }) {
    return HomeState(
      sellers: sellers ?? this.sellers,
      products: products ?? this.products,
      cartCount: cartCount ?? this.cartCount,
    );
  }

  @override
  List<Object> get props => [sellers, products, cartCount];
}
