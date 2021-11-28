part of 'services.dart';

class RatingServices {
  static Future<ApiReturnValue<ResRating>> sendRating(
      RatingRequest ratingRequest,
      {http.Client? client}) async {
    client ??= http.Client();

    Uri url = Uri.parse(baseURL + 'rating');
    var response = await client.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode(ratingRequest.toJson()),
    );

    if (response.statusCode != 200) {
      return const ApiReturnValue(
        message: 'Maaf data rating masih salah, silahkan coba lagi !!',
        isSuccess: false,
      );
    }

    var data = jsonDecode(response.body);

    String message = data['meta']['message'];
    ResRating order = ResRating.fromJson(data['data']);

    return ApiReturnValue<ResRating>(
      message: message,
      isSuccess: true,
      value: order,
    );
  }

  static Future<ApiReturnValue<Rating>> fetchRating(
      {http.Client? client}) async {
    var userId = locator<AuthPreferences>().getCustomerId();

    client ??= http.Client();

    Uri url = Uri.parse(baseURL + 'rating/$userId');

    var response = await client.get(url, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    });

    if (response.statusCode != 200) {
      return const ApiReturnValue(
        message: 'Maaf data penilaian anda tidak ditemukan !!',
        isSuccess: false,
      );
    }

    var data = jsonDecode(response.body);
    print(data);

    Rating rating = Rating.fromJson(data['data']['ratings']);

    return ApiReturnValue<Rating>(
      message: 'Data penilaian ditemukan',
      isSuccess: true,
      value: rating,
    );
  }
}
