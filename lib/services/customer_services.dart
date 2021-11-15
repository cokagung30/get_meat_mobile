part of 'services.dart';

class CustomerService {
  static Future<ApiReturnValue<User>> signUp(User user,
      {http.Client? client}) async {
    client ??= http.Client();

    Uri url = Uri.parse(baseURL + 'auth/register-customer');
    var response = await client.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode != 200) {
      return const ApiReturnValue(
          message: 'Maaf datamu masih ada yang salah !!', isSuccess: false);
    }

    var data = jsonDecode(response.body);
    String message = data['data']['message'];
    User userData = User.fromJson(data['data']['customer']);

    return ApiReturnValue<User>(
      message: message,
      isSuccess: true,
      value: userData,
    );
  }

  static Future<ApiReturnValue<User>> uploadProfilePicture(
      String picturePath, int userId,
      {http.MultipartRequest? request}) async {
    var url = Uri.parse(baseURL + 'auth/photo/$userId');

    request ??= http.MultipartRequest("POST", url)
      ..headers["Content-Type"] = "application/json";

    var multipartFile = await http.MultipartFile.fromPath('file', picturePath);
    request.files.add(multipartFile);

    var response = await request.send();
    await response.stream.bytesToString();
    if (response.statusCode == 200) {
      return const ApiReturnValue(
          message: 'Upload foto profile berhasil', isSuccess: true);
    }
    return const ApiReturnValue(
        message: "Upload foto profile gagal", isSuccess: false);
  }

  static Future<ApiReturnValue<User>> signIn(String email, String password,
      {http.Client? client}) async {
    client ??= http.Client();

    Uri url = Uri.parse(baseURL + 'auth/login-customer');
    var response = await client.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email_pembeli": email, "password": password}),
    );

    if (response.statusCode != 200) {
      return const ApiReturnValue(
          message: 'Maaf datamu masih ada yang salah !!', isSuccess: false);
    }

    var data = jsonDecode(response.body);

    User userData = User.fromJson(data['data']['customer']);

    return ApiReturnValue<User>(
      message: data['data']['access_token'],
      isSuccess: true,
      value: userData,
    );
  }
}
