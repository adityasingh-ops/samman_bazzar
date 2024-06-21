import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:samman_bazzar/Controllers/cart_controller.dart';
import 'package:samman_bazzar/Controllers/popuplar_prodet_controller.dart';
import 'package:samman_bazzar/Controllers/recomended_product_controller.dart';
import 'package:samman_bazzar/routes/routeshelper/route_helper.dart';
import 'package:samman_bazzar/tools/app_constans.dart';
import 'package:samman_bazzar/tools/app_icon.dart';
import 'package:samman_bazzar/tools/colors.dart';
import 'package:samman_bazzar/tools/dimension.dart';
import 'package:samman_bazzar/tools/large_text.dart';
import 'package:samman_bazzar/tools/small_text.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: Dimension.height20 * 3,
            right: Dimension.width20,
            left: Dimension.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getIntial());
                  },
                  child: AppIcon(
                    icon: Icons.arrow_back_ios,
                    iconcolor: Colors.white,
                    backgroundcolor: AppColors.mainColor,
                    iconsize: Dimension.iconSize24,
                  ),
                ),
                SizedBox(
                  width: Dimension.width20 * 5,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getIntial());
                  },
                  child: AppIcon(
                    icon: Icons.home_outlined,
                    iconcolor: Colors.white,
                    backgroundcolor: AppColors.mainColor,
                    iconsize: Dimension.iconSize24,
                  ),
                ),
                AppIcon(
                  icon: Icons.shopping_cart_outlined,
                  iconcolor: Colors.white,
                  backgroundcolor: AppColors.mainColor,
                  iconsize: Dimension.iconSize24,
                ),
              ],
            ),
          ),
          Positioned(
            top: Dimension.height20 * 5,
            right: Dimension.width20,
            left: Dimension.width20,
            bottom: 0,
            child: Container(
              margin: EdgeInsets.only(top: Dimension.height15),
              //color: Color.fromARGB(255, 232, 80, 9),
              child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: GetBuilder<CartController>(
                    builder: (cartcontroller) {
                      var _cartItems = cartcontroller.getItems;
                      return ListView.builder(
                        itemCount: _cartItems.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: double.maxFinite,
                            height: Dimension.height20 * 5,
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                   var popularindex = Get.find<PopularProductController>().popularProductList.indexOf(_cartItems[index].product!);
                                   if(popularindex >=0){
                                     Get.toNamed(RouteHelper.getPopularFood(popularindex,"CartPage"));
                                   }else{
                                    var recommendedindex = Get.find<RecomendedProductController>().recomendedProductList.indexOf(_cartItems[index].product!);
                                    Get.toNamed(RouteHelper.getRecomendedFood(recommendedindex,"CartPage"));
                                   }
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        bottom: Dimension.width10),
                                    height: Dimension.height20 * 5,
                                    width: Dimension.width20 * 5,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(
                                          Dimension.radius20),
                                      image: DecorationImage(
                                        image: NetworkImage(AppConstants.BASEURL +
                                            AppConstants.UPLOADURL +
                                            cartcontroller.getItems[index].img!),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: Dimension.width10,
                                ),
                                Expanded(
                                  child: Container(
                                    height: Dimension.height20 * 5,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        BigText(
                                          text: cartcontroller
                                              .getItems[index].name!,
                                          color: Colors.black54,
                                        ),
                                        SmallText(text: "spicy"),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            BigText(
                                              text: cartcontroller
                                                  .getItems[index].price!
                                                  .toString(),
                                              color: Colors.redAccent,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Dimension.radius20),
                                              ),
                                              padding: EdgeInsets.only(
                                                left: Dimension.width10,
                                                right: Dimension.width10,
                                                top: Dimension.height10,
                                                bottom: Dimension.height10,
                                              ),
                                              child: Row(
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      if (_cartItems[index]
                                                              .quantity! >
                                                          1) {
                                                        cartcontroller.AddItem(
                                                            _cartItems[index]
                                                                .product!,
                                                            -1);
                                                      } else if (_cartItems[
                                                                  index]
                                                              .quantity ==
                                                          1) {
                                                        showDialog(
                                                          context: context,
                                                          builder: (context) {
                                                            return AlertDialog(
                                                              backgroundColor: AppColors.mainColor,
                                                              title: Center(
                                                                child: BigText(
                                                                    text:
                                                                        "Alert!"),
                                                              ),
                                                              content: BigText(
                                                                  text:
                                                                      "You can't reduce more!",color: Colors.white,),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.pop(
                                                                        context);
                                                                        cartcontroller.AddItem(
                                                            _cartItems[index]
                                                                .product!,
                                                            -1); // Close the dialog
                                                                  },
                                                                  child: Text(
                                                                      "Delete",style: TextStyle(color: Colors.redAccent),), // Use Text widget instead of BigText
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      }
                                                    },
                                                    child: Icon(
                                                      Icons.remove,
                                                      color:
                                                          AppColors.signColor,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      width: Dimension.width10 /
                                                          2),
                                                  BigText(
                                                      text: _cartItems[index]
                                                          .quantity
                                                          .toString()), //popularProduct.inCartItems.toString()),
                                                  SizedBox(
                                                      width: Dimension.width10 /
                                                          2),
                                                  GestureDetector(
                                                      onTap: () {
                                                        cartcontroller.AddItem(
                                                            _cartItems[index]
                                                                .product!,
                                                            1);
                                                      },
                                                      child: Icon(Icons.add,
                                                          color: AppColors
                                                              .signColor)),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      );
                    },
                  )),
            ),
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<CartController>(
        builder: (cartProduct) {
          return Container(
            height: Dimension.height120,
            padding: EdgeInsets.only(
              left: Dimension.width10,
              right: Dimension.width10,
              bottom: Dimension.height20,
              top: Dimension.height20,
            ),
            decoration: BoxDecoration(
              color: AppColors.buttonBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimension.radius20 * 2),
                topRight: Radius.circular(Dimension.radius20 * 2),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Dimension.radius20),
                  ),
                  padding: EdgeInsets.only(
                    left: Dimension.width20,
                    right: Dimension.width20,
                    top: Dimension.height20,
                    bottom: Dimension.height20,
                  ),
                  child: Row(
                    children: [
                      BigText(text: "Rs"),
                      SizedBox(width: Dimension.width10 / 2),
                      BigText(text: cartProduct.totalAmount.toString()),
                      SizedBox(width: Dimension.width10 / 2),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: Dimension.width20,
                    right: Dimension.width20,
                    top: Dimension.height20,
                    bottom: Dimension.height20,
                  ),
                  child: BigText(text: "Check Out"),
                  decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(Dimension.radius20),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
