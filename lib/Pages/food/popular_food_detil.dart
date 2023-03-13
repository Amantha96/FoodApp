import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/Pages/home/main_food-page.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/app_column.dart';
import 'package:foodapp/widgets/app_icon.dart';
import 'package:foodapp/widgets/exandable_text_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utils/colors.dart';
import '../../widgets/Big_Text.dart';
import '../../widgets/icon_and_text_widget.dart';
import '../../widgets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //background image
          Positioned(
            left: 0,
              right: 0,
              child: Container(
                width:double.maxFinite,
                height: Dimensions.popularFoodImgSize,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                        "images/OIP (12).jpg"

                    )

                  )


                ),


      )),
          //icon widgets
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap:(){

                      Get.to(()=>MainFoodPage());
                    },
                    child:
                    AppIcon(icon: Icons.arrow_back_ios)),
                AppIcon(icon: Icons.shopping_cart_checkout_outlined),
              ],
            ),

          ),
          //introduction of food
          Positioned(
            left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.popularFoodImgSize-20,
              child: Container(
                padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,top: Dimensions.height20),
                 decoration: BoxDecoration(

                   borderRadius: BorderRadius.only(
                     topRight: Radius.circular(Dimensions.radius20),
                     topLeft: Radius.circular(Dimensions.radius20),

                   ),
                   color: Colors.white
                   
                 ),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(text:"Chinese Side"),
                    SizedBox(height: Dimensions.height20,),
                    BigText(text: "Introduce"),
                    SizedBox(height: Dimensions.height20,),
                    Expanded(child: SingleChildScrollView(child: ExpandableTextWidget(text: "Chicken biryani is a delicious Pakistani/Indian rice dish that's typically reserved for special occasions such as weddings, parties, or holidays such as Ramadan. It has a lengthy preparation, but the work is definitely worth it. For biryani, basmati rice is the ideal variety to use.Chicken biryani is a delicious Pakistani/Indian rice dish that's typically reserved for special occasions such as weddings, parties, or holidays such as Ramadan. It has a lengthy preparation, but the work is definitely worth it. For biryani, basmati rice is the ideal variety to use. Chicken biryani is a delicious Pakistani/Indian rice dish that's typically reserved for special occasions such as weddings, parties, or holidays such as Ramadan. It has a lengthy preparation, but the work is definitely worth it. For biryani, basmati rice is the ideal variety to use. It has a lengthy preparation, but the work is definitely worth it. For biryani, basmati rice is the ideal variety to use. It has a lengthy preparation, but the work is definitely worth it. For biryani, basmati rice is the ideal variety to use. It has a lengthy preparation, but the work is definitely worth it. For biryani, basmati rice is the ideal variety to use. It has a lengthy preparation, but the work is definitely worth it. For biryani, basmati rice is the ideal variety to use. It has a lengthy preparation, but the work is definitely worth it. For biryani, basmati rice is the ideal variety to use. It has a lengthy preparation, but the work is definitely worth it. For biryani, basmati rice is the ideal variety to use. It has a lengthy preparation, but the work is definitely worth it. For biryani, basmati rice is the ideal variety to use. It has a lengthy preparation, but the work is definitely worth it. For biryani, basmati rice is the ideal variety to use. It has a lengthy preparation, but the work is definitely worth it. For biryani, basmati rice is the ideal variety to use",)))
                  ],

                )




          ))

        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.bottomHeightBar,
        padding: EdgeInsets.only(top:Dimensions.height30,bottom: Dimensions.height30,left: Dimensions.width20,right: Dimensions.width20),
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius20*2),
            topRight: Radius.circular(Dimensions.radius20*2),
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(top: Dimensions.height20,bottom: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white
              ),
              child: Row(
                children: [
                  Icon(Icons.remove,color:Colors.black54,),
                  SizedBox(width: Dimensions.width10/2,),
                  BigText(text:"0"),
                  SizedBox(width: Dimensions.width10/2,),
                  Icon(Icons.add,color: Colors.black54,),
                ],

              ),

            ),
            Container(
              padding: EdgeInsets.only(top:Dimensions.height20,bottom: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20),
              child: BigText(text: "\$10 | Add to cart",color: Colors.white,),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: AppColors.mainColor

              ),

            )
          ],

        ),
      ),
    );
  }
}
