import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samman_bazzar/Controllers/cart_controller.dart';
import 'package:samman_bazzar/data/repository/popular_product.dart';
import 'package:samman_bazzar/models/cart_model.dart';
import 'package:samman_bazzar/models/popular_product_model.dart';
import 'package:samman_bazzar/tools/colors.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  late CartController _cart;

  bool _isLoading = false;
  bool get isLoading => _isLoading;


  int _quantity = 0;

  int get getquantity=> _quantity;
  int _incartItem  = 0;
  int get inCartItems => _incartItem+_quantity;
  
  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if(response.statusCode == 200){
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products as Iterable);
      _isLoading = true;
      update();
    }else{
      print('Error');
    }
  }
  void setQuantity(bool isIncreament){
    if(isIncreament){
      _quantity = checkQuantity(_quantity+1);
    }else{
      _quantity = checkQuantity(_quantity-1);

    }
    update();
    
  }
  int checkQuantity(int quantity){
    if((_incartItem+quantity)<0){
    
    Get.snackbar("Item Count","you can't reduce more!",
    backgroundColor: AppColors.mainColor,
    colorText:Colors.white,
    );
    if(_incartItem>0){
      _quantity = -_incartItem;
      return _quantity;
    }
      return 0;
    }
    if((_incartItem+quantity)>20){
      Get.snackbar("Item Count","you can't add more!",
    backgroundColor: AppColors.mainColor,
    colorText:Colors.white,
    );
      return 20;
    }else{
      return quantity;
    }
  }
  void initProduct(ProductModel product, cart){
    _quantity = 0;

    _incartItem = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);

    if(exist){
      _incartItem = _cart.getQuantity(product);
    }
  }
  void addItem(ProductModel product){
    // if(_quantity>0){
      _cart.AddItem(product, _quantity);
      _quantity = 0;
       _incartItem = _cart.getQuantity(product);
    update();
  }
  int get totalItems{
    return _cart.totalItems;
  }
  List<CartModel> get getItems{
    return _cart.getItems;
  }
}