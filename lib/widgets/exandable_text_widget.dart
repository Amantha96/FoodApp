import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/Pages/home/dimensions.dart';
import 'package:foodapp/colors.dart';
import 'package:foodapp/widgets/small_text.dart';


class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText=true;


  double tetxtHeight=Dimensions.screenHeight/5.63;

  @override

  void initState(){
    super.initState();
    if(widget.text.length>tetxtHeight){
      firstHalf= widget.text.substring(0,tetxtHeight.toInt());
      secondHalf= widget.text.substring(tetxtHeight.toInt()+1,widget.text.length);
    }
    else{
      firstHalf=widget.text;
      secondHalf="";

    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:secondHalf.isEmpty?SmallText(text: firstHalf):Column(
        children: [
          SmallText(text: hiddenText?(firstHalf+"..."):(firstHalf+secondHalf)),
          InkWell(
            onTap:(){
              setState(() {
                hiddenText=!hiddenText;
              });


            },

            child: Row(
              children: [
                SmallText(text: "Show more",color: AppColors.mainColor,),
                Icon(Icons.arrow_drop_down,color: AppColors.mainColor,)
              ],

            ),
          )

        ],
    )

    );
  }
}
