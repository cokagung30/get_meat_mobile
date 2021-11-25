part of 'product_detail_cubit.dart';

class ProductDetailState extends Equatable {
  const ProductDetailState({
    this.asyncProduct = const AsyncState.uninitialized(),
    this.asyncCart = const AsyncState.uninitialized(),
    this.quantity = 1,
    this.isDiffSeller = false,
    this.notes = "",
  });

  final AsyncState<Product> asyncProduct;
  final AsyncState<Cart> asyncCart;
  final int quantity;
  final String notes;
  final bool isDiffSeller;

  ProductDetailState copyWith({
    AsyncState<Product>? asyncProduct,
    AsyncState<Cart>? asyncCart,
    int? quantity,
    bool? isDiffSeller,
    String? notes,
  }) {
    return ProductDetailState(
      asyncProduct: asyncProduct ?? this.asyncProduct,
      asyncCart: asyncCart ?? this.asyncCart,
      quantity: quantity ?? this.quantity,
      isDiffSeller: isDiffSeller ?? this.isDiffSeller,
      notes: notes ?? this.notes,
    );
  }

  @override
  List<Object> get props => [
        asyncProduct,
        quantity,
        isDiffSeller,
        notes,
        asyncCart,
      ];
}
