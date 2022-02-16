part of 'product_detail_cubit.dart';

class ProductDetailState extends Equatable {
  const ProductDetailState({
    this.asyncProduct = const AsyncState.uninitialized(),
    this.asyncCart = const AsyncState.uninitialized(),
    this.quantity = 1,
    this.isDiffSeller = false,
    this.notes = "",
    this.unit = "gram",
    this.validated = false,
  });

  final AsyncState<Product> asyncProduct;
  final AsyncState<Cart> asyncCart;
  final double quantity;
  final String notes;
  final String unit;
  final bool isDiffSeller;
  final bool validated;

  ProductDetailState copyWith({
    AsyncState<Product>? asyncProduct,
    AsyncState<Cart>? asyncCart,
    double? quantity,
    bool? isDiffSeller,
    String? notes,
    String? unit,
    bool? validated,
  }) {
    return ProductDetailState(
      asyncProduct: asyncProduct ?? this.asyncProduct,
      asyncCart: asyncCart ?? this.asyncCart,
      quantity: quantity ?? this.quantity,
      isDiffSeller: isDiffSeller ?? this.isDiffSeller,
      notes: notes ?? this.notes,
      validated: validated ?? this.validated,
      unit: unit ?? this.unit,
    );
  }

  @override
  List<Object> get props => [
        asyncProduct,
        quantity,
        isDiffSeller,
        notes,
        asyncCart,
        validated,
        unit,
      ];
}
