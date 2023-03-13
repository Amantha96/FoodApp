import 'package:foodapp/Pages/food/popular_food_detil.dart';
import 'package:foodapp/Pages/home/main_food-page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class RouteHelper{
  static const String initial="/";
  static const String popularFood="/popular-food";


  static List<GetPage> routes=[
    GetPage (name: "/",page: ()=>MainFoodPage()),
    GetPage(name:popularFood,page: (){
      print("popular food get clled");
return PopularFoodDetail();



    }),

  ];



}