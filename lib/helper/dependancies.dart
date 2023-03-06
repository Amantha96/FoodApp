import 'package:foodapp/controllers/popular_product_controller.dart';
import 'package:foodapp/data/api/api_client.dart';
import 'package:foodapp/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';

Future<void>init()async {
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: "http://www.dbestech.com"));

  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

  // controoler

  Get.lazyPut(() => PopularProductController(popularProductRepo:Get.find ()));


}