import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/colors.dart';
import 'package:foodapp/widgets/Big_Text.dart';

import '../widgets/small_text.dart';
import 'dimensions.dart';
import 'food_page_body.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //showing the header
          Container(

            child: Container(
              margin: EdgeInsets.only(top:Dimensions.height45,bottom: Dimensions.height10),
              padding:EdgeInsets.only(left:Dimensions.width20,right: Dimensions.width20) ,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(text: "Srlanka",size: 20,color: AppColors.mainColor,),
                      Row(
                        children: [
                          SmallText( text: 'Kandy',color:AppColors.textColor,),
                          Icon(Icons.arrow_drop_down_rounded)

                        ],
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      width:Dimensions.height45,
                      height: Dimensions.height45,
                      child: Icon(Icons.search, color:Colors.white,size:Dimensions.iconSize24),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius15),
                        color: AppColors.mainColor,
                      ),
                    ),
                  ),

                ],
              ) ,
            ),
          ),
          //showing the body
          FoodPageBody(),
        ],

      ),
    );
  }
}
