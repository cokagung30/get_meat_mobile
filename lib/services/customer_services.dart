part of 'services.dart';

class CustomerService {
  static Future<ApiReturnValue<String>> signUp(User user,
      {http.Client? client}) async {
    client ??= http.Client();

    Uri url = Uri.parse(baseURL + 'auth/register-customer');
    var response = await client.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(user.toJson()),
    );

    print(response.body);

    if (response.statusCode == 200) {
      return const ApiReturnValue(
          message: 'Maaf datamu masih ada yang salah !!', isSuccess: false);
    }

    var data = json.decode(response.body);
    String message = data['data']['message'];

    return ApiReturnValue<String>(message: message, isSuccess: true);
  }
}
