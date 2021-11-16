part of 'services.dart';

class ProductServices {
  static Future<ApiReturnValue<List<Product>>> fetchProducts(
      {int? limit,
      String? productName,
      int? sellerId,
      http.Client? client}) async {
    client ??= http.Client();

    Uri url = (limit != null)
        ? Uri.parse(baseURL + 'product?limit=$limit')
        : (sellerId != null)
            ? Uri.parse(baseURL + 'product?pedagang=$sellerId')
            : Uri.parse(baseURL + 'product?nama_produk=$productName');

    var response = await client.get(url);
    if (response.statusCode != 200) {
      return const ApiReturnValue(
          message: 'Data produk gagal diambil', isSuccess: false);
    }

    var data = jsonDecode(response.body);
    List<Product> products = (data['data'] as Iterable)
        .map((product) => Product.fromJson(product))
        .toList();

    return ApiReturnValue(value: products, isSuccess: true);
  }

  static Future<ApiReturnValue<Product>> fetchDetailProduct(
      {int? productId, http.Client? client}) async {
    client ??= http.Client();

    Uri url = Uri.parse(baseURL + 'product?id=$productId');
    var response = await client.get(url);

    if (response.statusCode != 200) {
      return const ApiReturnValue(
          message: 'Data produk gagal diambil', isSuccess: false);
    }

    var data = jsonDecode(response.body);
    Product products = Product.fromJson(data['data']);

    return ApiReturnValue(value: products, isSuccess: true);
  }
}
