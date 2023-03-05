import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/Pages/home/dimensions.dart';
import 'package:foodapp/colors.dart';
import 'package:foodapp/widgets/Big_Text.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(0),
              child: Container(
                color: Colors.white,

                child: Center(child: BigText(size:Dimensions.font26,text:"Silver app bar")),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5,bottom: 10),
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

            child: Text(
              "Chicken biryani is a delicious Pakistani/Indian rice dish that's typically reserved for special occasions such as weddings, parties, or holidays such as Ramadan. It has a lengthy preparation, but the work is definitely worth it. For biryani, basmati rice is the ideal variety to use.Chicken biryani is a delicious Pakistani/Indian rice dish that's typically reserved for special occasions such as weddings, parties, or holidays such as Ramadan. It has a lengthy preparation, but the work is definitely worth it. For biryani, basmati rice is the ideal variety to use. Chicken biryani is a delicious Pakistani/Indian rice dish that's typically reserved for special occasions such as weddings, parties, or holidays such as Ramadan. It has a lengthy preparation, but the work is definitely worth it. For biryani, basmati rice is the ideal variety to use. It has a lengthy preparation, but the work is definitely worth it. For biryani, basmati rice is the ideal variety to use. It has a lengthy preparation, but the work is definitely worth it. For biryani, basmati rice is the ideal variety to use. It has a lengthy preparation, but the work is definitely worth it. For biryani, basmati rice is the ideal variety to use. It has a lengthy preparation, but the work is definitely worth it. For biryani, basmati rice is the ideal variety to use. It has a lengthy preparation, but the work is definitely worth it. For biryani, basmati rice is the ideal variety to use. It has a lengthy preparation, but the work is definitely worth it. For biryani, basmati rice is the ideal variety to use. It has a lengthy preparation, but the work is definitely worth it. For biryani, basmati rice is the ideal variety to use. It has a lengthy preparation, but the work is definitely worth it. For biryani, basmati rice is the ideal variety to use. It has a lengthy preparation, but the work is definitely worth it. For biryani, basmati rice is the ideal variety to use Chicken biryani is a delicious Pakistani/Indian rice dish that's typically reserved for special occasions such as weddings, parties, or holidays such as Ramadan. It has a lengthy preparation, but the work is definitely worth it. For biryani, basmati rice is the ideal variety to use.Chicken biryani is a delicious Pakistani/Indian rice dish that's typically reserved for special occasions such as weddings, parties, or holidays such as Ramadan. It has a lengthy preparation, but the work is definitely worth it. For biryani, basmati rice is the ideal variety to use. Chicken biryani is a delicious Pakistani/Indian rice dish that's typically reserved for special occasions such as weddings, parties, or holidays such as Ramadan. It has a lengthy preparation, but the work is definitely worth it. For biryani, basmati rice is the ideal variety to use. It has a lengthy preparation, but the work is definitely worth it. For biryani, basmati rice is the ideal variety to use. It has a lengthy preparation, but the work is definitely worth it. For biryani, basmati rice is the ideal variety to use. It has a lengthy preparation, but the work is definitely worth it. For biryani, basmati rice is the ideal variety to use. It has a lengthy preparation, but the work is definitely worth it. For biryani, basmati rice is the ideal variety to use. It has a lengthy preparation, but the work is definitely worth it. For biryani, basmati rice is the ideal variety to use. It has a lengthy preparation, but the work is definitely worth it. For biryani, basmati rice is the ideal variety to use. It has a lengthy preparation, but the work is definitely worth it. For biryani, basmati rice is the ideal variety to use. It has a lengthy preparation, but the work is definitely worth it. For biryani, basmati rice is the ideal variety to use. It has a lengthy preparation, but the work is definitely worth it. For biryani, basmati rice is the ideal variety to use",


            ),
          )

        ],
      ),
    );
  }
}
