import 'package:app_two/food.dart';
import 'package:app_two/foodDetail.dart';
import 'package:app_two/food_model.dart';
import 'package:get/get.dart ';

class CartController extends GetxController{
  // data dictionary
  var _product = {}.obs;

  //add product to cart
  void addProduct(foodProduct foodproduct){
    if(_product.containsKey(foodproduct)){
      _product[foodproduct] += 1;

    }else{
      _product[foodproduct] = 1;
    }
  }

  //remove product

  //get product
get products => _product;
}