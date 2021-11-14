import 'package:get/route_manager.dart';
import 'package:get_meat_apps/routes/get_meat_screen.dart';
import 'package:get_meat_apps/routes/middleware/auth_middleware.dart';
import 'package:get_meat_apps/ui/pages/main/main_screen.dart';
import 'package:get_meat_apps/ui/pages/pages.dart';
import 'package:get/get.dart';

class GetMeatRoutes {
  static final screen = [
    GetPage(
      name: GetMeatScreen.splash,
      page: () => const SplashScreen(),
      preventDuplicates: true,
    ),
    GetPage(
      name: GetMeatScreen.getStarted,
      page: () => const GetStartedScreen(),
    ),
    GetPage(
      name: GetMeatScreen.login,
      page: () => const SignInScreen(),
    ),
    GetPage(
      name: GetMeatScreen.register,
      page: () => const SignUpScreen(),
    ),
    GetPage(
      name: GetMeatScreen.uploadProfilePic,
      page: () => UploadPhotoScreen(
        userId: Get.arguments['userId'],
      ),
    ),
    GetPage(
      name: GetMeatScreen.main,
      page: () => const MainScreen(),
      middlewares: [
        AuthMiddleware(),
      ],
    ),
  ];
}
