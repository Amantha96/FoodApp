import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/routes/route_helper.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommend_product_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

 Future<void> _loadResource() async {

   await Get.find<PopularProductController>().getPopularProductList();
   await Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  @override
  void initState() {
    super.initState();
    _loadResource();
    controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: 2))..forward();

    animation = CurvedAnimation(
        parent: controller,
        curve: Curves.linear);

    Timer(
      Duration(seconds: 3),
        ()=>Get.offNamed(RouteHelper.getInitial())
      

    );


    controller.forward().whenComplete(() {
      //TODO: Navigate to the next screen
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          ScaleTransition(scale: animation,
          child: Image.asset("![](../../../images/logo.png",width: 250)),
          Center(child: Image.asset("![](../../../images/food-txt3.png)",width: 250)),
        
        ],
      ),
    );
  }
/*@override
  void dispose() {
    controller.dispose();
    super.dispose();
  }*/

/*@override
  Widget build(BuildContext context) {
    return Container();
  }
}*/
}