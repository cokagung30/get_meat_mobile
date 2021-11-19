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
    checkDiffrentToSellerOrder(sellerId, id);
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

  void checkDiffrentToSellerOrder(int sellerId, int productId) async {
    int cartCount = await _cartLocalServices.checkProduct(null);
    if (cartCount > 0) {
      int cartCountBySeller =
          await _cartLocalServices.checkProductBySeller(sellerId);

      if (cartCountBySeller > 0) {
        Cart? cart = await _cartLocalServices.getCartProduct(productId);
        emit(
            state.copyWith(isDiffSeller: false, quantity: cart?.quantity ?? 1));
      } else {
        emit(state.copyWith(isDiffSeller: true));
      }
    } else {
      emit(state.copyWith(isDiffSeller: false));
    }
  }

  void addToCart() async {
    Product product = state.asyncProduct.data!;

    int cartCount = await _cartLocalServices.checkProduct(product.id);

    Cart cart = Cart(
      productId: product.id,
      productName: product.productName,
      productPrice: product.price,
      quantity: state.quantity,
      sellerId: product.seller.id,
      unit: product.unit,
      photoProduct: product.photoProduct,
    );

    if (cartCount > 0) {
      await _cartLocalServices.update(cart);
    } else {
      await _cartLocalServices.insert(cart);
    }
  }

  void removeAllCart() async {
    await _cartLocalServices.deleteAll();
    emit(state.copyWith(isDiffSeller: false));
  }
}
