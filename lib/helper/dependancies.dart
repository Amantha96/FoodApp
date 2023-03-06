import 'package:foodapp/data/api/api_client.dart';
import 'package:foodapp/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';

Future<void>init()async {
  Get.lazyPut(() => ApiClient(appBaseUrl: "http://www.dbestech.com"));
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));


}