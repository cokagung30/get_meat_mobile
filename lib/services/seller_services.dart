part of 'services.dart';

class SellerServices {
  static Future<ApiReturnValue<List<Seller>>> fetchSeller(
      {int? limit, String? sellerName, http.Client? client}) async {
    client ??= http.Client();

    Uri url = (limit != null)
        ? Uri.parse(baseURL + 'sellers?limit=$limit')
        : Uri.parse(baseURL + 'sellers?nama=$sellerName');

    var response = await client.get(url);

    if (response.statusCode != 200) {
      return const ApiReturnValue(
          message: 'Data pedagang gagal diambil', isSuccess: false);
    }

    var data = jsonDecode(response.body);
    List<Seller> sellers = (data['data'] as Iterable)
        .map((seller) => Seller.fromJson(seller))
        .toList();

    return ApiReturnValue(value: sellers, isSuccess: true);
  }

  static Future<ApiReturnValue<Seller>> fetchDetailSeller({
    int? sellerId,
    http.Client? client,
  }) async {
    client ??= http.Client();

    Uri url = Uri.parse(baseURL + 'sellers?id=$sellerId');
    var response = await client.get(url);

    if (response.statusCode != 200) {
      return const ApiReturnValue(
          message: 'Data pedagang gagal diambil', isSuccess: false);
    }

    var data = jsonDecode(response.body);
    Seller seller = Seller.fromJson(data['data']);

    return ApiReturnValue(value: seller, isSuccess: true);
  }
}
