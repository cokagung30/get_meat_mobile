part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    this.sellers = const AsyncState.uninitialized(),
    this.products = const AsyncState.uninitialized(),
  });

  final AsyncState<ApiReturnValue<List<Seller>>> sellers;
  final AsyncState<ApiReturnValue<List<Product>>> products;

  HomeState copyWith({
    AsyncState<ApiReturnValue<List<Seller>>>? sellers,
    AsyncState<ApiReturnValue<List<Product>>>? products,
  }) {
    return HomeState(
      sellers: sellers ?? this.sellers,
      products: products ?? this.products,
    );
  }

  @override
  List<Object> get props => [sellers, products];
}
