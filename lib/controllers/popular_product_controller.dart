import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/controllers/cart_controller.dart';
import 'package:foodapp/data/repository/popular_product_repo.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:get/get.dart';

import '../models/products_model.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList=[];
  List<dynamic> get  popularProductList => _popularProductList;
  late CartController _cart;

  bool _isLoaded=false;
  bool get isLoaded=>_isLoaded;

  int _quantity=0;
  int get quantity=>_quantity;

   int _inCartItems=0;
  int get inCartItems=>_inCartItems+_quantity;


  
  Future<void> getPopularProductList()async {
    Response response = await popularProductRepo.getPopularProductList();
    if(response.statusCode==200){


      _popularProductList=[];
      _popularProductList.addAll(Product.fromJson(response.body).products);

       _isLoaded=true;
      update();

      
    }else{


    }
    
  }
  
  void setQuantity(bool isIncrement){
    if(isIncrement){


  _quantity=checkQuantity(_quantity+1);

    }else{
      _quantity=checkQuantity(_quantity-1);
      print("decrement"+_quantity.toString());
    }
    update();
  }
   int checkQuantity(int quantity){
    if(quantity<0){
      Get.snackbar("Item count", "you can't reduce more !",
      backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 0 ;
    }else if (quantity>20){
      Get.snackbar("Item count", "you can't add more !",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 20;
    }else{
      return quantity;
    }

  }

  void initProduct(CartController cart){
    _quantity=0;
    _inCartItems=0;
    _cart = cart;
    //if exist
    //get from storage _inCartItems=3

  }

  void addItem(ProductModel product){
    _cart.addItem(product, _quantity);


  }

}

