part of 'search_product_cubit.dart';

class SearchProductState extends Equatable {
  const SearchProductState({
    this.query = '',
    this.products = const AsyncState.uninitialized(),
  });

  final String query;
  final AsyncState<List<Product>> products;

  SearchProductState copyWith({
    String? query,
    AsyncState<List<Product>>? products,
  }) {
    return SearchProductState(
      query: query ?? this.query,
      products: products ?? this.products,
    );
  }

  @override
  List<Object> get props => [query, products];
}
