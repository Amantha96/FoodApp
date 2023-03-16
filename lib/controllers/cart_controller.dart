import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../data/repository/cart_repo.dart';
import '../models/cart_model.dart';
import '../models/products_model.dart';
import '../utils/colors.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});
  Map<int, CartModel> _items = {};

  Map<int,CartModel>get items=>items ;

  void addItem(ProductModel product,int quantity){
    var totalQuntity=0;
 if(_items.containsKey(product.id)){
   _items.update(product.id!, (value) {

     totalQuntity=value.quantity!+quantity;

      return CartModel(
        id: value.id,
        name: value.name,
        price: value.price,
        img: value.img,
        quantity:value. quantity!+quantity,
        isExit: true,
        time: DateTime.now().toString(),

     );
   });
   if(totalQuntity<0){
     _items.remove(product.id);

   }

 }else{
   if(quantity>0){
     _items.putIfAbsent(product.id!,() {
       return CartModel(
         id: product.id,
         name: product.name,
         price: product.price,
         img: product.img,
         quantity: quantity,
         isExit: true,
         time: DateTime.now().toString(),

       );}

     );

   }else{
       Get.snackbar("Item count", "you should at least add an item in the cart   !",
         backgroundColor: AppColors.mainColor,
         colorText: Colors.white,
       );
   }



}
 }
 bool existIncart(ProductModel product){
    if(_items.containsKey(product.id)){
      return true;

    }
    return false;
 }

 getQuantity(ProductModel product){
    var quantity=0;
    if(_items.containsKey(product.id)){
      _items.forEach((key, value) {
        if(key==product.id){
          quantity =value.quantity!;

        }

      });

    }

return quantity;
 }

 int get totalItems{
    var totalQuantity=0;
    _items.forEach((key, value) {

      totalQuantity+=value.quantity!;
    });

    return totalQuantity;

 }

}



