import 'package:get_it/get_it.dart';
import 'package:get_meat_apps/data/preferences/auth_preferences.dart';

GetIt locator = GetIt.instance;

Future setupLocator() async {
  final instance = await AuthPreferences.instance();
  locator.registerSingleton<AuthPreferences>(instance);
}
