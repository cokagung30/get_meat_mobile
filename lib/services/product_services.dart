part of 'services.dart';

class ProductServices {
  static Future<ApiReturnValue<List<Product>>> fetchProducts(
      {int? limit, String? productName, http.Client? client}) async {
    client ??= http.Client();

    Uri url = (limit != null)
        ? Uri.parse(baseURL + 'product?limit=$limit')
        : Uri.parse(baseURL + 'product?nama=$productName');

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
}
