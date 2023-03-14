import 'package:foodapp/controllers/cart_controller.dart';
import 'package:foodapp/controllers/popular_product_controller.dart';
import 'package:foodapp/data/api/api_client.dart';
import 'package:foodapp/data/repository/%20%20recommemded_product_repo.dart';
import 'package:foodapp/data/repository/cart_repo.dart';
import 'package:foodapp/data/repository/popular_product_repo.dart';
import 'package:foodapp/utils/app_constants.dart';
import 'package:get/get.dart';

import '../controllers/recommend_product_controller.dart';

Future<void>init()async {
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo());

  // controller
  Get.lazyPut(() => PopularProductController(popularProductRepo:Get.find ()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo:Get.find ()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));


}