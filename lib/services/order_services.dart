part of 'services.dart';

class OrderServices {
  static Future<ApiReturnValue<CostPayment>> getCost(
      {required int sellerCity,
      required double totalWeight,
      required int destination,
      http.Client? client}) async {
    client ??= http.Client();

    Uri url = Uri.parse(rajaOngkirURL);
    var response = await client.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "key": rajaOngkirKey,
      },
      body: jsonEncode(
        <String, dynamic>{
          "origin": sellerCity,
          "weight": totalWeight,
          "destination": destination,
          "courier": 'jne',
        },
      ),
    );

    if (response.statusCode != 200) {
      return const ApiReturnValue(
          message: 'Maaf datamu masih ada yang salah !!', isSuccess: false);
    }

    var data = jsonDecode(response.body);

    print(response.body);

    CostPayment costPayment = CostPayment.fromJson(
        data['rajaongkir']['results'][0]['costs'][0]['cost'][0]);

    return ApiReturnValue<CostPayment>(
        message: 'Ongkos kirim ditemukan', isSuccess: true, value: costPayment);
  }

  static Future<ApiReturnValue<Order>> createOrder(OrderRequest orderRequest,
      {http.Client? client}) async {
    client ??= http.Client();
    print(token);
    Uri url = Uri.parse(baseURL + 'orders');
    var response = await client.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode(orderRequest.toJson()),
    );

    print(response.statusCode);
    if (response.statusCode != 200) {
      return const ApiReturnValue(
          message: 'Maaf data pesanan anda masih ada yang salah !!',
          isSuccess: false);
    }

    var data = jsonDecode(response.body);
    String message = data['meta']['message'];
    Order order = Order.fromJson(data['data']);
    print(order);

    return ApiReturnValue<Order>(
      message: message,
      isSuccess: true,
      value: order,
    );
  }

  static Future<ApiReturnValue<String>> uploadProofPayment(
      String picturePath, int orderId,
      {http.MultipartRequest? request}) async {
    var url = Uri.parse(baseURL + 'orders/upload_transfer/$orderId');

    request ??= http.MultipartRequest("POST", url)
      ..headers["Content-Type"] = "application/json"
      ..headers["Authorization"] = "Bearer $token";

    var multipartFile = await http.MultipartFile.fromPath('file', picturePath);
    request.files.add(multipartFile);

    var response = await request.send();
    var stream = await response.stream.bytesToString();
    print(stream);
    if (response.statusCode == 200) {
      return const ApiReturnValue(
          message: 'Upload foto pembayaran berhasil', isSuccess: true);
    }
    return const ApiReturnValue(
        message: "Upload foto pembayaran gagal", isSuccess: false);
  }
}
