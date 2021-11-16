import 'package:get/route_manager.dart';
import 'package:get_meat_apps/routes/get_meat_screen.dart';
import 'package:get_meat_apps/ui/pages/main/main_screen.dart';
import 'package:get_meat_apps/ui/pages/pages.dart';
import 'package:get/get.dart';
import 'package:get_meat_apps/ui/pages/product_detail/product_detail_screen.dart';
import 'package:get_meat_apps/ui/pages/search_products/search_product_screen.dart';
import 'package:get_meat_apps/ui/pages/search_sellers/search_sellers_screen.dart';
import 'package:get_meat_apps/ui/pages/seller_detail/seller_detail_screen.dart';

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
        user: Get.arguments['user'],
      ),
    ),
    GetPage(
      name: GetMeatScreen.main,
      page: () => const MainScreen(),
    ),
    GetPage(
      name: GetMeatScreen.searchProduct,
      page: () => const SearchProductScreen(),
    ),
    GetPage(
      name: GetMeatScreen.searchSeller,
      page: () => const SearchSellersScreen(),
    ),
    GetPage(
      name: GetMeatScreen.productDetail,
      page: () => ProductDetailScreen(
        id: Get.arguments['id'],
        sellerId: Get.arguments['sellerId'],
      ),
    ),
    GetPage(
      name: GetMeatScreen.sellerDetail,
      page: () => SellerDetailScreen(
        sellerId: Get.arguments['id'],
      ),
    ),
  ];
}
