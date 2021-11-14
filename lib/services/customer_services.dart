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
    print(data['data']);

    return ApiReturnValue<User>(
      message: message,
      isSuccess: true,
      value: userData,
    );
  }

  static Future<ApiReturnValue<User>> uploadProfilePicture(
      File pictureFile, int userId,
      {http.MultipartRequest? request}) async {
    var url = Uri.parse(baseURL + 'auth/photo/$userId');

    request ??= http.MultipartRequest("POST", url)
      ..headers["Content-Type"] = "application/json";

    var multipartFile =
        await http.MultipartFile.fromPath('file', pictureFile.path);
    request.files.add(multipartFile);

    var response = await request.send();
    await response.stream.bytesToString();
    if (response.statusCode == 200) {
      return const ApiReturnValue(
          message: 'Upload foto berhasil', isSuccess: true);
    }
    return const ApiReturnValue(
        message: "Upload Photo Profile Gagal", isSuccess: false);
  }
}
