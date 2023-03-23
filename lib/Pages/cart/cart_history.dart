import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/controllers/cart_controller.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/widgets/Big_Text.dart';
import 'package:foodapp/widgets/app_icon.dart';
import 'package:get/get.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var getCartHistoryList = Get.find<CartController>().getCartHistoryList();
    Map<String, int> cartItemsPerOrders = Map();
    for (int i = 0; i < getCartHistoryList.length; i++) {
      if (cartItemsPerOrders.containsKey(getCartHistoryList[i].time!)) {
        cartItemsPerOrders.update(getCartHistoryList[i].time!,
                (value) => ++value);
      } else
        cartItemsPerOrders.putIfAbsent(
            getCartHistoryList[i].time!, () => 1);
    }
    List<int> cartOrderTimeToList() {
      return cartItemsPerOrders.entries.map((e) => e.value).toList();
    }
    List<int> orderTimes = cartOrderTimeToList();
    var saveCounter = 0;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 100,
            color: AppColors.mainColor,
            width: double.maxFinite,
            padding: EdgeInsets.only(top: 45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BigText(
                  text: "Cart History",
                  color: Colors.white,
                ),
                AppIcon(
                  icon: Icons.shape_line_outlined,
                  iconColor: AppColors.mainColor,
                  backgroundColor: AppColors.yellowColor,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
