import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  // Create constructor for Cart class
  const Cart({
    this.id,
    required this.productId,
    required this.productName,
    required this.productPrice,
    required this.quantity,
    this.photoProduct,
    this.description,
    required this.sellerId,
  });

  final int? id;
  final int productId;
  final String productName;
  final int productPrice;
  final int quantity;
  final String? photoProduct;
  final String? description;
  final int sellerId;

  Cart.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        productId = json['product_id'],
        productName = json['product_name'],
        productPrice = json['product_price'],
        quantity = json['quantity'],
        photoProduct = json['photo_product'],
        description = json['description'],
        sellerId = json['seller_id'];

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['product_id'] = productId;
    map['product_name'] = productName;
    map['product_price'] = productPrice;
    map['quantity'] = quantity;
    map['photo_product'] = photoProduct;
    map['description'] = description;
    map['seller_id'] = sellerId;

    return map;
  }

  @override
  List<Object?> get props => [
        id,
        productId,
        productName,
        productPrice,
        quantity,
        photoProduct,
        description,
        sellerId,
      ];
}
