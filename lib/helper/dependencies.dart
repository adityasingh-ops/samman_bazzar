import 'package:get/get.dart';
import 'package:samman_bazzar/Controllers/cart_controller.dart';
import 'package:samman_bazzar/Controllers/popuplar_prodet_controller.dart';
import 'package:samman_bazzar/Controllers/recomended_product_controller.dart';
import 'package:samman_bazzar/data/api/api_client.dart';
import 'package:samman_bazzar/data/repository/cart_repo.dart';
import 'package:samman_bazzar/data/repository/popular_product.dart';
import 'package:samman_bazzar/data/repository/recomended_repo.dart';
import 'package:samman_bazzar/tools/app_constans.dart';

Future<void> init() async{
  //Api client........
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASEURL));

  //repository........
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecomendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo());

  //controller........
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecomendedProductController(recomendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}