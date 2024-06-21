import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samman_bazzar/Controllers/cart_controller.dart';
import 'package:samman_bazzar/Controllers/popuplar_prodet_controller.dart';
import 'package:samman_bazzar/routes/routeshelper/route_helper.dart';
import 'package:samman_bazzar/tools/app_column.dart';
import 'package:samman_bazzar/tools/app_constans.dart';
import 'package:samman_bazzar/tools/app_icon.dart';
import 'package:samman_bazzar/tools/colors.dart';
import 'package:samman_bazzar/tools/dimension.dart';
import 'package:samman_bazzar/tools/expandable_text.dart';
import 'package:samman_bazzar/tools/large_text.dart';

// ignore: must_be_immutable
class PopularFoodDetail extends StatelessWidget {
  int pageId;
  String Page;
  PopularFoodDetail({super.key, required this.pageId, required this.Page});

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimension.popularfoodimg,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(AppConstants.BASEURL +
                      AppConstants.UPLOADURL +
                      product.img!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: Dimension.height45,
            left: Dimension.width20,
            right: Dimension.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      if (Page == "CartPage") {
                        Get.toNamed(RouteHelper.cartpage);
                      } else {
                        Get.toNamed(RouteHelper.getIntial());
                      }
                    },
                    child: AppIcon(icon: Icons.arrow_back_ios)),
                GetBuilder<PopularProductController>(builder: (controller) {
                  return GestureDetector(
                    onTap: () {
                      if (controller.totalItems > 0) {
                        Get.toNamed(RouteHelper.getCartPage());
                      } else {
                        Get.snackbar("Cart", "No item in cart!");
                      }
                    },
                    child: Stack(
                      children: [
                        AppIcon(
                          icon: Icons.shopping_cart_outlined,
                        ),
                        Get.find<PopularProductController>().totalItems >= 1
                            ? Positioned(
                                top: 0,
                                right: 0,
                                child: AppIcon(
                                  icon: Icons.circle,
                                  size: 20,
                                  iconcolor: Colors.transparent,
                                  backgroundcolor: AppColors.mainColor,
                                ))
                            : Container(),
                        Get.find<PopularProductController>().totalItems >= 1
                            ? Positioned(
                                top: 2.6,
                                right: 3,
                                child: BigText(
                                  text: Get.find<PopularProductController>()
                                      .totalItems
                                      .toString(),
                                  size: 12,
                                  color: Colors.white,
                                ))
                            : Container(),
                      ],
                    ),
                  );
                })
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: Dimension.popularfoodimg - Dimension.height45,
            child: Container(
              height: Dimension.PageView,
              padding: EdgeInsets.only(
                  left: Dimension.width20,
                  right: Dimension.width20,
                  top: Dimension.height20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimension.radius20),
                  topRight: Radius.circular(Dimension.radius20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(
                    text: product.name!,
                  ),
                  SizedBox(height: Dimension.height20),
                  BigText(text: "Information"),
                  SizedBox(height: Dimension.height10),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableText(text: product.description!),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: (popularProduct) {
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
                      GestureDetector(
                        onTap: () {
                          popularProduct.setQuantity(false);
                        },
                        child: Icon(
                          Icons.remove,
                          color: AppColors.signColor,
                        ),
                      ),
                      SizedBox(width: Dimension.width10 / 2),
                      BigText(text: popularProduct.inCartItems.toString()),
                      SizedBox(width: Dimension.width10 / 2),
                      GestureDetector(
                          onTap: () {
                            popularProduct.setQuantity(true);
                          },
                          child: Icon(Icons.add, color: AppColors.signColor)),
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
                  child: GestureDetector(
                      onTap: () {
                        popularProduct.addItem(product);
                        Get.snackbar(
                            duration: Duration(milliseconds: 900),
                            "Item Count",
                            "Item added to cart!");
                      },
                      child:
                          BigText(text: "\₹ ${product.price!} | Add to cart")),
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
