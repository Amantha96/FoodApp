import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/utills/dimensions.dart';
import 'package:foodapp/utills/colors.dart';
import 'package:foodapp/widgets/Big_Text.dart';
import 'package:foodapp/widgets/app_icon.dart';
import 'package:foodapp/widgets/exandable_text_widget.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 75,
            title:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_checkout_outlined)
              ],

            ) ,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(

                child: Center(child: BigText(size:Dimensions.font26,text:"Chinese Side",)),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5,bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20),

                  )

                ),
              )

            ),
            pinned:true,
            backgroundColor: AppColors.yellowColor ,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                  "images/OIP (12).jpg",
                width: double.maxFinite,
                fit: BoxFit.cover,

              ),


            ),

          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(

                  child: ExpandableTextWidget(text:"Chicken biryani is a delicious Pakistani/Indian rice dish that's typically reserved for special occasions such as weddings, parties, or holidays such as Ramadan. It has a lengthy preparation, but the work is definitely worth it. For biryani, basmati rice is the ideal variety to use.Chicken biryani is a delicious Pakistani/Indian rice dish that's typically reserved for special occasions such as weddings, parties, or holidays such as Ramadan. It has a lengthy preparation, but the work is definitely worth it. For biryani, basmati rice is the ideal variety to use. Chicken biryani is a delicious Pakistani/Indian rice dish that's typically reserved for special occasions such as weddings, parties, or holidays such as Ramadan. It has a lengthy preparation, but the work is definitely worth it. For biryani, basmati rice is the ideal variety to use. It has a lengthy preparation, but the work is definitely worth it. For biryani, basmati rice is the ideal variety to use. It has a lengthy preparation, but the work is definitely worth it. For biryani, basmati rice is the ideal variety to use. It has a lengthy preparation, but the work is definitely worth it. For biryani, basmati rice is the ideal variety to use. It has a lengthy preparation, but the work is definitely worth it. For biryani, basmati rice is the ideal variety to use. It has a lengthy preparation, but the work is definitely worth it. For biryani, basmati rice is the ideal variety to use. It has a lengthy preparation, but the work is definitely worth it. For biryani, basmati rice is the ideal variety to use. It has a lengthy preparation, but the work is definitely worth it. For biryani, basmati rice is the ideal variety to use. It has a lengthy preparation, but the work is definitely worth it. For biryani, basmati rice is the ideal variety to use. It has a lengthy preparation, but the work is definitely worth it. For biryani, basmati rice is the ideal variety to use Chicken biryani is a delicious Pakistani/Indian rice dish that's typically reserved for special occasions such as weddings, parties, or holidays such as Ramadan. It has a lengthy preparation, but the work is definitely worth it. For biryani, basmati rice is the ideal variety to use.Chicken biryani is a delicious Pakistani/Indian rice dish that's typically reserved for special occasions such as weddings, parties, or holidays such as Ramadan. It has a lengthy preparation, but the work is definitely worth it. For biryani, basmati rice is the ideal variety to use. Chicken biryani is a delicious Pakistani/Indian rice dish that's typically reserved for special occasions such as weddings, parties, or holidays such as Ramadan. It has a lengthy preparation, but the work is definitely worth it. For biryani, basmati rice is the ideal variety to use. It has a lengthy preparation, but the work is definitely worth it. For biryani, basmati rice is the ideal variety to use. It has a lengthy preparation, but the work is definitely worth it. For biryani, basmati rice is the ideal variety to use. It has a lengthy preparation, but the work is definitely worth it. For biryani, basmati rice is the ideal variety to use. It has a lengthy preparation, but the work is definitely worth it. For biryani, basmati rice is the ideal variety to use. It has a lengthy preparation, but the work is definitely worth it. For biryani, basmati rice is the ideal variety to use. It has a lengthy preparation, but the work is definitely worth it. For biryani, basmati rice is the ideal variety to use. It has a lengthy preparation, but the work is definitely worth it. For biryani, basmati rice is the ideal variety to use. It has a lengthy preparation, but the work is definitely worth it. For biryani, basmati rice is the ideal variety to use. It has a lengthy preparation, but the work is definitely worth it. For biryani, basmati rice is the ideal variety to use"),
                    margin:EdgeInsets.only(left:Dimensions.width20,right:Dimensions.width20  )

                )
              ],
            ),
          )

        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: Dimensions.width20*2.5,
              right: Dimensions.width20*2.5,
              top: Dimensions.height10,
              bottom: Dimensions.height10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  iconsize: Dimensions.iconSize24,
                    iconColor:Colors.white,
                    backgroundColor:AppColors.mainColor,
                    icon: Icons.remove),
                BigText(text:"\$12.88 "+" x "+" 0 ",color: Colors.black,size: Dimensions.font26,),
                AppIcon(
                    iconsize: Dimensions.iconSize24,
                    iconColor:Colors.white,
                    backgroundColor:AppColors.mainColor,
                    icon: Icons.add),



              ],
            ),
          ),
          Container(
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
                  child:Icon(
                    Icons.favorite,
                    color: AppColors.mainColor,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top:Dimensions.height15,bottom: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20),
                  child: BigText(text: "\$10 | Add to cart",color: Colors.white,size: Dimensions.font16,),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: AppColors.mainColor

                  ),

                )

              ],

            ),
          ),
        ],

      ),
    );
  }
}
