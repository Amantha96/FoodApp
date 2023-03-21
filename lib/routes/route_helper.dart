import 'package:foodapp/Pages/cart/cart_page.dart';
import 'package:foodapp/Pages/food/popular_food_detil.dart';
import 'package:foodapp/Pages/home/main_food-page.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../Pages/food/recommendes_food_details.dart';
import '../Pages/home/home_page.dart';

class RouteHelper{
  static const String initial="/";
  static const String popularFood="/popular-food";
  static const String recommendedFood="/recommended-food";
  static const String cartPage="/cart-page";

  static String getInitial()=>'$initial';
  static String getPopularFood(int pageId,String page)=>'$popularFood?pageId=$pageId&$page';
  static String getRecommendedFood(int pageId)=>'$recommendedFood?pageId=$pageId';
  static String getCartPage()=>'$cartPage';


  static List<GetPage> routes=[
    GetPage (name: initial,page: ()=>HomePage()),
    GetPage(name:popularFood,page: (){
      var pageId=Get.parameters['pageId'];
      var page =Get.parameters["page"];

return PopularFoodDetail(pageId:int.parse(pageId!),page:page!);
    },
    transition:Transition.fadeIn



    ),
    GetPage(name:recommendedFood,page: (){
      var pageId=Get.parameters['pageId'];
      var page =Get.parameters["page"];
      return RecommendedFoodDetail(pageId:int.parse(pageId!));
    },
        transition:Transition.fadeIn
    ),
    GetPage(name:cartPage,page:(){
      return CartPage();

    },
    transition:Transition.fadeIn
    )
  ];



}