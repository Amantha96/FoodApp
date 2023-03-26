import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/controllers/cart_controller.dart';
import 'package:foodapp/models/cart_model.dart';
import 'package:foodapp/utils/app_constants.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/app_icon.dart';
import 'package:foodapp/widgets/big_text.dart';
import 'package:foodapp/widgets/small_text.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../base/no_data_page.dart';
import '../../routes/route_helper.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({Key? key}) : super(key: key);

  get i => null;

  @override
  Widget build(BuildContext context) {
    var getCartHistoryList = Get.find<CartController>()
        .getCartHistoryList().reversed.toList();
    Map<String, int> cartItemsPerOrders = Map();
    for (int i = 0; i < getCartHistoryList.length; i++) {
      if (cartItemsPerOrders.containsKey(getCartHistoryList[i].time!)) {
        cartItemsPerOrders.update(
            getCartHistoryList[i].time!, (value) => ++value);
      } else {
        cartItemsPerOrders.putIfAbsent(
            getCartHistoryList[i].time!, () => 1);
      }
    }
   List<int>cartItemsPerOrderToList(){
      return cartItemsPerOrders.entries.map((e) => e.value).toList();

   }
    List<String>cartOrderTimeToList(){
      return cartItemsPerOrders.entries.map((e) => e.key).toList();

    }
    List<int>itemsPerOrder=cartItemsPerOrderToList();

    var listCounter=0;

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: Dimensions.height10*10,
            color: AppColors.mainColor,
            width: double.maxFinite,
            padding: EdgeInsets.only(top: Dimensions.height45),
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
          ),
          GetBuilder<CartController>(builder: (_cartController){
            return _cartController.getCartHistoryList().length>0?Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    top: Dimensions.height20,
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                  ),
                  child: MediaQuery.removePadding(
                      removeTop: true,
                      context: context,
                      child: ListView.builder(
                        itemCount: cartItemsPerOrders.length,
                        itemBuilder: (context, index) {
                          var orderDate =
                          cartItemsPerOrders.keys.elementAt(index);
                          var itemCount = itemsPerOrder[index];
                          int listCounter = 0;
                          Container(
                            height: Dimensions.height30*4,
                            margin: EdgeInsets.only(bottom: Dimensions.height20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ((){
                                  DateTime parseDate= DateFormat("yyyy-MM-dd HH:mm:ss").parse(getCartHistoryList[listCounter].time!);
                                  var inputDate=DateTime.parse(parseDate.toString());
                                  var outputFormat= DateFormat("MM/dd/yyyy hh:mm a");
                                  var outputDate= outputFormat.format(inputDate);
                                  return BigText(text:outputDate);
                                }()),
                                SizedBox(height: Dimensions.height10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children:[
                                    Wrap(
                                      direction: Axis.horizontal,
                                      children: List.generate(itemCount, (index) {
                                        if (listCounter < getCartHistoryList.length) {
                                          var cartModel =
                                          getCartHistoryList[listCounter];
                                          listCounter++;
                                          return index <= 2
                                              ? Container(
                                            height: Dimensions.height20*4,
                                            width: Dimensions.height20*4,
                                            margin: EdgeInsets.only(
                                                right: Dimensions.width10 / 2),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(
                                                  Dimensions.radius15 / 2),
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    AppConstants.BASE_URL +
                                                        AppConstants.UPLOAD_URL +
                                                        cartModel.img!),
                                              ),
                                            ),
                                          )
                                              : Container();
                                        } else {
                                          return Container();
                                        }
                                      }),
                                    ),
                                    Container(

                                      height: 80,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SmallText(text: "Total",color: AppColors.textColor),
                                          BigText(text: itemsPerOrder[i].toString()+"Items",color: AppColors.textColor,),
                                          GestureDetector(
                                            onTap: (){
                                              var orderTime=cartOrderTimeToList();
                                              Map<int,CartModel>moreOrder={};
                                              for(int j=0;j<getCartHistoryList.length;j++){
                                                if(getCartHistoryList[j].time==orderTime[i]){
                                                  moreOrder.putIfAbsent(getCartHistoryList[j].id!, () =>
                                                      CartModel.fromJson(jsonDecode(jsonEncode(getCartHistoryList[j])))
                                                  );
                                                }
                                              }
                                              Get.find<CartController>().setItems=moreOrder;
                                              Get.find<CartController>().addToCartList();
                                              Get.toNamed(RouteHelper.getCartPage());
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(horizontal: Dimensions.width10,
                                                  vertical:Dimensions.height10/2),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(Dimensions.radius15/3),
                                                border: Border.all(width: 1,color: AppColors.mainColor),
                                              ),
                                              child: SmallText(text: "one more",color: AppColors.mainColor,),
                                            ),

                                          )

                                        ],

                                      ),

                                    ),

                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      )),
                )):
            NoDataPage(text:"you didn't buy anything so far !",imgPath:"images/empty cart.png");

          })
        ],
      ),
    );
  }
}
