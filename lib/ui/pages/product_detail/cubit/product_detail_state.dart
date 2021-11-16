part of 'product_detail_cubit.dart';

class ProductDetailState extends Equatable {
  const ProductDetailState({
    this.asyncProduct = const AsyncState.uninitialized(),
    this.quantity = 1,
    this.isDiffSeller = false,
  });

  final AsyncState<Product> asyncProduct;
  final int quantity;
  final bool isDiffSeller;

  ProductDetailState copyWith({
    AsyncState<Product>? asyncProduct,
    int? quantity,
    bool? isDiffSeller,
  }) {
    return ProductDetailState(
      asyncProduct: asyncProduct ?? this.asyncProduct,
      quantity: quantity ?? this.quantity,
      isDiffSeller: isDiffSeller ?? this.isDiffSeller,
    );
  }

  @override
  List<Object> get props => [asyncProduct, quantity, isDiffSeller];
}
