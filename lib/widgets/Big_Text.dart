import 'package:flutter/cupertino.dart';
//import 'package:foodapp/home/dimensions.dart';

import '../utills/dimensions.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overflow;

  BigText({Key? key, this.color = const Color(0xFF332d2b),
    required this.text,
    this.size=20,
    this.overflow=TextOverflow.ellipsis
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text (
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        fontFamily: 'TiltWarp-Regular',
          color:color,
        fontSize: Dimensions.font26,
        fontWeight: FontWeight.w400
      ),
    );
  }
}
