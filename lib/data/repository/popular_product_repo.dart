import 'package:foodapp/data/api/api_client.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService{
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});

  Future<Response>getPopularProductList() async{
    return await apiClient.getData("https://mvs.bslmeiyu.com/api/v1/products/popular");
    
  }

}

