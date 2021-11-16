part of 'product_detail_cubit.dart';

class ProductDetailState extends Equatable {
  const ProductDetailState({
    this.asyncProduct = const AsyncState.uninitialized(),
    this.quantity = 1,
  });

  final AsyncState<Product> asyncProduct;
  final int quantity;

  ProductDetailState copyWith({
    AsyncState<Product>? asyncProduct,
    int? quantity,
  }) {
    return ProductDetailState(
      asyncProduct: asyncProduct ?? this.asyncProduct,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  List<Object> get props => [asyncProduct, quantity];
}
