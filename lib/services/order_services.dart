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

    CostPayment costPayment = CostPayment.fromJson(
        data['rajaongkir']['results'][0]['costs'][0]['cost'][0]);

    return ApiReturnValue<CostPayment>(
        message: 'Ongkos kirim ditemukan', isSuccess: true, value: costPayment);
  }
}
