import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:get_meat_apps/data/async_state.dart';
import 'package:get_meat_apps/data/local/models/cart.dart';
import 'package:get_meat_apps/data/local/services/cart_local_services.dart';
import 'package:get_meat_apps/model/models.dart';
import 'package:get_meat_apps/services/services.dart';

part 'product_detail_state.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  ProductDetailCubit(this.id, this.sellerId)
      : super(const ProductDetailState()) {
    loadProductDetail();
    checkDifferentToSellerOrder(sellerId, id);
  }

  final int id;
  final int sellerId;
  final CartLocalServices _cartLocalServices = CartLocalServices();

  void addQty() {
    if (state.quantity < state.asyncProduct.data!.stock) {
      emit(state.copyWith(quantity: state.quantity + 1));
    }
  }

  void minQty() {
    if (state.quantity > 1) {
      emit(state.copyWith(quantity: state.quantity - 1));
    }
  }

  void loadProductDetail() async {
    emit(state.copyWith(asyncProduct: const AsyncState.loading()));
    try {
      final product = await ProductServices.fetchDetailProduct(productId: id);
      emit(state.copyWith(asyncProduct: AsyncState.success(product.value)));
    } catch (e) {
      if (e is DioError) {
        emit(state.copyWith(asyncProduct: AsyncState.error(e)));
      }
    }
  }

  void changeNote(String note) {
    emit(state.copyWith(notes: note));
  }

  void changeQuantity(String quantity) {
    bool isValid = false;
    double inputQuantity = 0;
    if (quantity.isNotEmpty) {
      inputQuantity = double.parse(quantity);
      isValid = true;
      if (state.unit == 'gram' && inputQuantity < 100) {
        isValid = false;
      } else if (state.unit == 'kilogram' && (inputQuantity * 1000) < 100) {
        isValid = false;
      } else {
        isValid = true;
      }
    }
    emit(state.copyWith(
      validated: isValid,
      quantity: inputQuantity,
    ));
  }

  void checkDifferentToSellerOrder(int sellerId, int productId) async {
    int cartCount = await _cartLocalServices.checkProduct(null);
    if (cartCount > 0) {
      int cartCountBySeller =
          await _cartLocalServices.checkProductBySeller(sellerId);

      if (cartCountBySeller > 0) {
        Cart? cart = await _cartLocalServices.getCartProduct(productId);
        emit(state.copyWith(
          isDiffSeller: false,
          quantity: cart?.quantity ?? 1,
          notes: cart?.description ?? '',
        ));
      } else {
        emit(state.copyWith(isDiffSeller: true));
      }
    } else {
      emit(state.copyWith(isDiffSeller: false));
    }
  }

  void addToCart(String notes) async {
    Product product = state.asyncProduct.data!;

    Cart cart = Cart(
      productId: product.id,
      productName: product.productName,
      productPrice: product.price,
      quantity: (state.unit == "gram") ? state.quantity : state.quantity * 1000,
      sellerId: product.seller.id,
      unit: 'gram',
      photoProduct: product.photoProduct,
      description: state.notes,
    );

    await _cartLocalServices.deleteAll();
    int inserted = await _cartLocalServices.insert(cart);

    if (inserted > 0) {
      Cart? newCart = await _cartLocalServices.getCartProduct(product.id);

      emit(state.copyWith(asyncCart: AsyncState.success(newCart)));
    } else {
      emit(state.copyWith(asyncCart: AsyncState.error(Exception('Gagal'))));
    }
  }

  void removeAllCart() async {
    await _cartLocalServices.deleteAll();
    emit(state.copyWith(isDiffSeller: false));
  }

  void selectedUnit(String unit) {
    bool isValid = false;
    double inputQuantity = 0;
    if (unit == 'gram') {
      inputQuantity = state.quantity;
    } else {
      inputQuantity = state.quantity * 1000;
    }

    if (inputQuantity >= 100) {
      isValid = true;
    }
    emit(state.copyWith(
      unit: unit,
      validated: isValid,
    ));
  }
}
