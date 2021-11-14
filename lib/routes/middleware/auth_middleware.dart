import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_meat_apps/data/preferences/auth_preferences.dart';
import 'package:get_meat_apps/injection.dart';
import 'package:get_meat_apps/routes/get_meat_screen.dart';

class AuthMiddleware extends GetMiddleware {
  final authPreferences = locator<AuthPreferences>().getToken();

  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if (authPreferences == null) {
      return const RouteSettings(name: GetMeatScreen.getStarted);
    }

    return null;
  }
}
