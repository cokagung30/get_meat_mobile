import 'package:get/route_manager.dart';
import 'package:get_meat_apps/routes/get_meat_screen.dart';
import 'package:get_meat_apps/ui/pages/complete_transaction/complete_transaction_screen.dart';
import 'package:get_meat_apps/ui/pages/detail_order/detail_order_screen.dart';
import 'package:get_meat_apps/ui/pages/main/main_screen.dart';
import 'package:get_meat_apps/ui/pages/pages.dart';
import 'package:get/get.dart';
import 'package:get_meat_apps/ui/pages/payment/payment_screen.dart';
import 'package:get_meat_apps/ui/pages/product_detail/product_detail_screen.dart';
import 'package:get_meat_apps/ui/pages/rating/rating_screen.dart';
import 'package:get_meat_apps/ui/pages/search_products/search_product_screen.dart';
import 'package:get_meat_apps/ui/pages/search_sellers/search_sellers_screen.dart';
import 'package:get_meat_apps/ui/pages/seller_detail/seller_detail_screen.dart';
import 'package:get_meat_apps/ui/pages/sended_proof/sended_proof_screen.dart';
import 'package:get_meat_apps/ui/pages/transfer_bank/transfer_bank_screen.dart';
import 'package:get_meat_apps/ui/pages/update_photo_profile/upload_photo_screen.dart';

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
      page: () => const MainScreen(initalPage: 0),
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
    GetPage(
      name: GetMeatScreen.payment,
      page: () => PaymentScreen(
        product: Get.arguments['product'],
      ),
    ),
    GetPage(
      name: GetMeatScreen.transferBank,
      page: () => TransferBankScreen(
        order: Get.arguments['order'],
      ),
    ),
    GetPage(
      name: GetMeatScreen.orderSuccess,
      page: () => CompleteTransactionScreen(
        url: Get.arguments['url'],
      ),
    ),
    GetPage(
      name: GetMeatScreen.orderDetail,
      page: () => DetailOrderScreen(
        order: Get.arguments['order'],
      ),
    ),
    GetPage(
      name: GetMeatScreen.orderFinish,
      page: () => SendedProofScreen(
        order: Get.arguments['order'],
      ),
    ),
    GetPage(
      name: GetMeatScreen.orderFinish,
      page: () => SendedProofScreen(
        order: Get.arguments['order'],
      ),
    ),
    GetPage(
      name: GetMeatScreen.updatePhotoProfile,
      page: () => UpdatePhotoProfile(
        user: Get.arguments['user'],
      ),
    ),
    GetPage(
      name: GetMeatScreen.ratingUser,
      page: () => const RatingScreen(),
    ),
  ];
}
