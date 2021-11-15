import 'package:get_meat_apps/model/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthPreferences {
  static AuthPreferences? _instance;
  static SharedPreferences? _prefs;

  final String _tokenKey = 'token';
  final String _customerIdKey = 'customerId';
  final String _customerNameKey = 'customerName';
  final String _customerEmailKey = 'customerEmail';
  final String _customerPhotoProfile = 'customerPhotoProfile';

  static Future<AuthPreferences> instance() async {
    _instance ??= AuthPreferences();

    _prefs ??= await SharedPreferences.getInstance();
    return _instance!;
  }

  void setPrefData(String token, User user) {
    _prefs!.setString(_tokenKey, token);
    _prefs!.setString(_customerIdKey, user.id.toString());
    _prefs!.setString(_customerNameKey, user.customerName);
    _prefs!.setString(_customerEmailKey, user.customerEmail);
    _prefs!.setString(_customerPhotoProfile, user.customerProfilePicture);
  }

  String? getToken() {
    return _prefs!.getString(_tokenKey);
  }

  String? getCustomerId() {
    return _prefs!.getString(_customerIdKey);
  }

  String? getCustomerName() {
    return _prefs!.getString(_customerNameKey);
  }

  String? getCustomerEmail() {
    return _prefs!.getString(_customerEmailKey);
  }

  String? getCustomerPhotoProfile() {
    return _prefs!.getString(_customerPhotoProfile);
  }

  void removeShared() {
    _prefs!.remove(_tokenKey);
    _prefs!.remove(_customerIdKey);
    _prefs!.remove(_customerNameKey);
    _prefs!.remove(_customerEmailKey);
    _prefs!.remove(_customerPhotoProfile);
  }

  void removePhotoProfile() {
    _prefs!.remove(_customerPhotoProfile);
  }
}
