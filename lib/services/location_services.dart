part of 'services.dart';

class LocationServices {
  static Future<ApiReturnValue<List<Province>>> getProvince(
      {http.Client? client}) async {
    client ??= http.Client();

    Uri url = Uri.parse(baseURL + 'province');
    var response = await client.get(url);

    if (response.statusCode != 200) {
      return const ApiReturnValue(message: 'Provinsi gagal diambil');
    }

    var data = jsonDecode(response.body);
    List<Province> provinces = (data['data'] as Iterable)
        .map((province) => Province.fromJson(province))
        .toList();

    return ApiReturnValue(value: provinces);
  }
}
