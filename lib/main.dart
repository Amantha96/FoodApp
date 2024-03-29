import 'package:flutter/material.dart';
import 'package:foodapp/Pages/main_food-page.dart';
import 'package:foodapp/controllers/popular_product_controller.dart';
import 'package:foodapp/controllers/recommend_product_controller.dart';
import 'package:foodapp/routes/route_helper.dart';
import 'package:get/get.dart';

import 'Pages/cart/cart_page.dart';
import 'Pages/food/popular_food_detil.dart';
import 'Pages/food/recommendes_food_details.dart';
import 'Pages/home/food_page_body.dart';
import 'Pages/home/main_food-page.dart';
import 'controllers/cart_controller.dart';
import 'helper/dependancies.dart'as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   Get.find<CartController>().getCartData();
    return GetBuilder<PopularProductController>(
      builder: (_) {
        return GetBuilder<RecommendedProductController>(
          builder: (_) {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              //home: SplashScreen(),

              initialRoute: RouteHelper.getSplshPage(),
             getPages: RouteHelper.routes,
            ); // Replace this with your widget tree
          },);
      },);
  }
}

