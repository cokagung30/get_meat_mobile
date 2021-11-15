part of 'models.dart';

class Product extends Equatable {
  const Product({
    required this.id,
    required this.productName,
    required this.price,
    required this.stock,
    required this.unit,
    required this.description,
    required this.photoProduct,
    required this.seller,
  });

  final int id;
  final String productName;
  final int price;
  final int stock;
  final String unit;
  final String description;
  final String photoProduct;
  final Seller seller;

  Product.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        productName = json['nama_produk'],
        price = json['harga_jual'],
        stock = json['stok_tersisa'],
        unit = json['satuan'],
        description = json['description'],
        photoProduct = json['photo_produk'],
        seller = Seller.fromJson(json['seller']);

  @override
  List<Object> get props => [
        id,
        productName,
        price,
        stock,
        unit,
        description,
        photoProduct,
        seller,
      ];
}
