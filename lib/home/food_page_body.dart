import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/colors.dart';
import 'package:foodapp/widgets/Big_Text.dart';
import 'package:foodapp/widgets/icon_and_text_widget.dart';
import 'package:foodapp/widgets/small_text.dart';

import 'dimensions.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction:0.85 );
  var currPageValue=0.0;
  double scaleFactor=0.8;
  double _height = Dimensions.pageViewContainer;

  @override
  void initState(){
    super.initState();
    pageController.addListener(() {
     setState(() {
       currPageValue= pageController.page!;
      // print("Current page value is"+currPageValue.toString());
     });
    });

  }
  @override
  void dispose(){
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          //color: Color.redAccent,
          height: Dimensions.pageView,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context,position) {
                return _buildPageItem(position);
              }),
        ),
    new DotsIndicator(
    dotsCount: 5,
    position: currPageValue,
    decorator: DotsDecorator(
      activeColor: AppColors.mainColor ,
    size: const Size.square(9.0),
    activeSize: const Size(18.0, 9.0),
    activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
    ),
    )


      ],

    );

  }
  Widget _buildPageItem(int index){
    Matrix4 matrix= new Matrix4.identity();
    if(index==currPageValue.floor()){
      var currScale = 1-(currPageValue-index)*(1-scaleFactor);
      var currTrans= _height*(1-currScale)/2;
      matrix=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

    }else if (index==currPageValue.floor()+1){
      var currScale = scaleFactor+(currPageValue-index+1)*(1-scaleFactor);
      var currTrans= _height*(1-currScale)/2;
      matrix=Matrix4.diagonal3Values(1, currScale, 1);
      matrix=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

    }else if (index==currPageValue.floor()-1){
      var currScale = 1-(currPageValue-index)*(1-scaleFactor);
      var currTrans= _height*(1-currScale)/2;
      matrix=Matrix4.diagonal3Values(1, currScale, 1);
      matrix=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

    }else{
      var currScale=0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-scaleFactor)/2,1);
      
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
        Container(
        height:Dimensions.pageViewContainer ,
        margin: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius30),
            color:index.isEven? Color(0xFF69c5df):Color(0xFF9294cc),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  "images/OIP (12).jpg",
                )
            )
        ),
      ),
          Align(
            alignment:Alignment.bottomCenter ,
            child: Container(
              height: Dimensions.pageViewTextContainer ,
              margin: EdgeInsets.only(left: Dimensions.width30,right: Dimensions.width30,bottom: Dimensions.height30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color:index.isEven?Color(0xFFFFFFFF):Color(0xFFFFFFFF),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0,5)


                  ),
                  BoxShadow(
                    color:Colors.white,
                    offset: Offset(-5,0)
                  ),
            BoxShadow(
                color:Colors.white,
                offset: Offset(-5,0)
            )
                ]
              ),
              child:Container(
                padding: EdgeInsets.only(top:Dimensions.height15,left:15,right:15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start ,
                  children: [
                    BigText(text: "Chinese Side"),
                    SizedBox(height:Dimensions.height10,),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) {return Icon(Icons.star,color:AppColors.mainColor,size:15 ,);}),
                        ),
                        SizedBox(width: 10,),
                        SmallText(text: "4.5"),
                        SizedBox(width: 10,),
                        SmallText(text: "1287"),
                        SizedBox(width: 10,),
                        SmallText(text: "Comments"),
                      ],

                    ),
                    SizedBox(height: Dimensions.height20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        IconAndTextWidget(icon: Icons.circle_sharp,
                            text: "Normal",
                            iconColor: AppColors.iconColor1),
                        IconAndTextWidget(icon: Icons.location_on,
                            text: "1.7km",
                            iconColor: AppColors.mainColor),
                        IconAndTextWidget(icon: Icons.access_time_rounded,
                            text: "32min",
                            iconColor: AppColors.iconColor2)


                      ],
                    )



                  ],

                ),

              ) ,
            ),
          )

        ],


      ),
    );
  }
}
