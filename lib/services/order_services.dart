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
        {
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

    CostPayment costPayment = CostPayment.fromJson(
        data['rajaongkir']['results'][0]['costs'][0]['cost'][0]);

    return ApiReturnValue<CostPayment>(
        message: 'Ongkos kirim ditemukan', isSuccess: true, value: costPayment);
  }

  static Future<ApiReturnValue<Order>> createOrder(OrderRequest orderRequest,
      {http.Client? client}) async {
    client ??= http.Client();

    Uri url = Uri.parse(baseURL + 'orders');
    var response = await client.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode(orderRequest.toJson()),
    );

    if (response.statusCode == 403) {
      return const ApiReturnValue(
        message: 'Token kadaluwarsa',
        isSuccess: false,
        isAuth: false,
      );
    } else if (response.statusCode != 200) {
      return const ApiReturnValue(
        message: 'Maaf data pesanan anda masih ada yang salah !!',
        isSuccess: false,
      );
    }

    var data = jsonDecode(response.body);
    String message = data['meta']['message'];
    Order order = Order.fromJson(data['data']);

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
    await response.stream.bytesToString();

    if (response.statusCode == 200) {
      return const ApiReturnValue(
          message: 'Upload foto pembayaran berhasil', isSuccess: true);
    }
    return const ApiReturnValue(
        message: "Upload foto pembayaran gagal", isSuccess: false);
  }

  static Future<ApiReturnValue<List<Order>>> fetchOrders(
      {http.Client? client}) async {
    var userId = locator<AuthPreferences>().getCustomerId();

    client ??= http.Client();

    Uri url = Uri.parse(baseURL + 'orders?customer_id=$userId');

    var response = await client.get(url, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    });

    if (response.statusCode != 200) {
      return const ApiReturnValue(
        message: 'Maaf data pesanan anda tidak ditemukan !!',
        isSuccess: false,
      );
    }

    var data = jsonDecode(response.body);
    List<Order> orders =
        (data['data'] as Iterable).map((e) => Order.fromJson(e)).toList();

    return ApiReturnValue<List<Order>>(
      message: 'Data pesanan ditemukan',
      isSuccess: true,
      value: orders,
    );
  }

  static Future<ApiReturnValue<bool>> cancelOrder(
      {required int orderId, http.Client? client}) async {
    client ??= http.Client();

    Uri url = Uri.parse(baseURL + 'orders/$orderId');

    var response = await client.delete(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode != 200) {
      return const ApiReturnValue(
        message: 'Maaf data pesanan anda tidak ditemukan !!',
        isSuccess: false,
        value: false,
      );
    }

    return const ApiReturnValue<bool>(
      message: 'Pesanan berhasil dibatalkan',
      isSuccess: true,
      value: true,
    );
  }

  static Future<ApiReturnValue<String>> uploadSendedProof(
      String picturePath, int orderId,
      {http.MultipartRequest? request}) async {
    var url = Uri.parse(baseURL + 'orders/upload_send_proof/$orderId');

    request ??= http.MultipartRequest("POST", url)
      ..headers["Content-Type"] = "application/json"
      ..headers["Authorization"] = "Bearer $token";

    var multipartFile = await http.MultipartFile.fromPath('file', picturePath);
    request.files.add(multipartFile);

    var response = await request.send();
    await response.stream.bytesToString();

    if (response.statusCode == 200) {
      return const ApiReturnValue(
          message: 'Upload foto bukti penerimaan berhasil', isSuccess: true);
    }

    return const ApiReturnValue(
        message: "Upload foto bukti penerimaan gagal", isSuccess: false);
  }

  static Future<ApiReturnValue<bool>> finishOrder(
      {required int orderId, http.Client? client}) async {
    client ??= http.Client();

    Uri url = Uri.parse(baseURL + 'orders/finish/$orderId');

    var response = await client.put(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode != 200) {
      return const ApiReturnValue(
        message: 'Maaf data pesanan anda tidak ditemukan !!',
        isSuccess: false,
        value: false,
      );
    }

    return const ApiReturnValue<bool>(
      message: 'Pesanan berhasil terkirim, terima kasih',
      isSuccess: true,
      value: true,
    );
  }
}
