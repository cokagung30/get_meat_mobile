import 'dart:convert';

import 'package:get_meat_apps/data/preferences/auth_preferences.dart';
import 'package:get_meat_apps/injection.dart';
import 'package:get_meat_apps/model/request/order_request.dart';
import 'package:get_meat_apps/model/request/rating_request.dart';
import 'package:get_meat_apps/model/request/user_request.dart';
import 'package:http/http.dart' as http;

import 'package:get_meat_apps/model/models.dart';

part 'location_services.dart';
part 'customer_services.dart';
part 'seller_services.dart';
part 'product_services.dart';
part 'order_services.dart';
part 'rating_services.dart';

String baseURL = 'https://get-meat.baliworkberkarya.com/api/';
String imageURL = 'https://get-meat.baliworkberkarya.com/storage/';
String rajaOngkirURL = 'https://api.rajaongkir.com/starter/cost';

String rajaOngkirKey = 'd1ecd6e8c8deb62aba88f5b255f8b1c8';

var token = locator<AuthPreferences>().getToken() ?? "";
