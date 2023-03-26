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

  Map<int, CartModel> get items => items;
  //only for storage and sharedpreferences

  List<CartModel>storageItem=[];
  void addItem(ProductModel product, int quantity) {
    var totalQuntity = 0;
    if (_items.containsKey(product.id)) {
      _items.update(product.id!, (value) {
        totalQuntity = value.quantity! + quantity;

        return CartModel(
          id: value.id,
          name: value.name,
          price: value.price,
          img: value.img,
          quantity: value.quantity! + quantity,
          isExit: true,
          time: DateTime.now().toString(),
          product: product,

        );
      });
      if (totalQuntity < 0) {
        _items.remove(product.id);
      }
    } else {
      if (quantity > 0) {
        _items.putIfAbsent(product.id!, () {
          return CartModel(
            id: product.id,
            name: product.name,
            price: product.price,
            img: product.img,
            quantity: quantity,
            isExit: true,
            time: DateTime.now().toString(),
            product: product,

          );
        }

        );
      } else {
        Get.snackbar(
          "Item count", "you should at least add an item in the cart   !",
          backgroundColor: AppColors.mainColor,
          colorText: Colors.white,
        );
      }
    }
    cartRepo.addToCartList(getItems);
    update();
  }

  bool existIncart(ProductModel product) {
    if (_items.containsKey(product.id)) {
      return true;
    }
    return false;
  }

  int getQuantity(ProductModel product) {
    var quantity = 0;
    if (_items.containsKey(product.id)) {
      _items.forEach((key, value) {
        if (key == product.id) {
          quantity = value.quantity!;
        }
      });
    }

    return quantity;
  }
//print(totalItems);
  int get totalItems  {
    var totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity += value.quantity!;
    });

    return totalQuantity;
  }

  List<CartModel> get getItems {
    return _items.entries.map((e) {
      return e.value;
    }).toList();
  }
  int get totalAmount{
    var total=0;

    _items.forEach((key, value) {
       total += value.quantity!*value.price!;

    });

    return total;

  }

   List<CartModel> getCartData(){
    setCart = cartRepo.getCartList();
    return storageItem;
}

set setCart(List<CartModel>items) {
  storageItem = items;
  print("Length of cart items" + storageItem.length.toString());

  for (int i = 0; i < storageItem.length; i++) {
    _items.putIfAbsent(storageItem[i].product!.id!, () => storageItem[i]);
  }
}
    void addToHistory(){
      cartRepo.addToCartHistoryList();
      clear();
    }
    void clear(){
    _items={};
    update();
    }
    List<CartModel>getCartHistoryList(){
    return cartRepo.getCartHistoryList();
    }
    set setItems(Map<int,CartModel>setItems){
    _items={};
    _items=setItems;


    }
  void addToCartList(){
    cartRepo.addToCartList(getItems);
    update();

  }
  }




