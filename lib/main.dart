import 'package:flutter/material.dart';
//import 'package:foodapp/Pages/main_food-page.dart';
import 'package:get/get.dart';

import 'Pages/food/popular_food_detil.dart';
import 'Pages/food/recommendes_food_details.dart';
import 'Pages/home/main_food-page.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: RecommendedFoodDetail(),
    );
  }
}

