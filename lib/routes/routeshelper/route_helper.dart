import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:samman_bazzar/Pages/Foodpage/popular_food_detail.dart';
import 'package:samman_bazzar/Pages/Foodpage/recomended_food.dart';
import 'package:samman_bazzar/Pages/HomePage/Home_Page.dart';
import 'package:samman_bazzar/Pages/HomePage/main_food_page.dart';
import 'package:samman_bazzar/Pages/cart/cart_page.dart';

class RouteHelper{
  static const String intial = '/';
  static const String popularfood = '/popular-food';
  static const String recomendedfood = '/recomended-food';
  static const String cartpage = '/cart-page';



  static String getIntial()=>'$intial';
  static String getPopularFood(int pageId, String Page)=>'$popularfood?pageId=$pageId&Page=$Page';
  static String getRecomendedFood(int pageId,String Page)=>'$recomendedfood?pageId=$pageId&Page=$Page';
  static String getCartPage()=>'$cartpage';


  static List<GetPage> route = [
    GetPage(name: intial, page:()=>const HomePage(),
    transition: Transition.fadeIn,
    ),
    GetPage(name: popularfood, page:(){
      var pageId = Get.parameters['pageId'];
      var Page = Get.parameters['Page'];
      return PopularFoodDetail(pageId:int.parse(pageId!), Page:Page!);
      },
    transition: Transition.fadeIn,
    ),
    GetPage(name: recomendedfood, page:(){
      var pageId = Get.parameters['pageId'];
      var Page = Get.parameters['Page'];
      return RecomendedFoodDetail(pageId:int.parse(pageId!), Page:Page!);
      },
    transition: Transition.fadeIn,
    ),
    GetPage(name: cartpage, page:()=>const CartPage(),
    transition: Transition.fadeIn,
    ),

  ];
}