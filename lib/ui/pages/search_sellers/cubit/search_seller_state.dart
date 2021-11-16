part of 'search_seller_cubit.dart';

class SearchSellerState extends Equatable {
  const SearchSellerState({
    this.query = '',
    this.sellers = const AsyncState.uninitialized(),
  });

  final String query;
  final AsyncState<List<Seller>> sellers;

  SearchSellerState copyWith({
    String? query,
    AsyncState<List<Seller>>? sellers,
  }) {
    return SearchSellerState(
      query: query ?? this.query,
      sellers: sellers ?? this.sellers,
    );
  }

  @override
  List<Object> get props => [query, sellers];
}
