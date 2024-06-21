import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samman_bazzar/Controllers/cart_controller.dart';
import 'package:samman_bazzar/Controllers/popuplar_prodet_controller.dart';
import 'package:samman_bazzar/Controllers/recomended_product_controller.dart';
import 'package:samman_bazzar/routes/routeshelper/route_helper.dart';
import 'package:samman_bazzar/tools/app_icon.dart';
import 'package:samman_bazzar/tools/colors.dart';
import 'package:samman_bazzar/tools/dimension.dart';
import 'package:samman_bazzar/tools/expandable_text.dart';
import 'package:samman_bazzar/tools/large_text.dart';
import 'package:samman_bazzar/tools/app_constans.dart';

// ignore: must_be_immutable
class RecomendedFoodDetail extends StatelessWidget {
  int pageId;
  String Page;
  RecomendedFoodDetail({super.key, required this.pageId, required this.Page});

  @override
  Widget build(BuildContext context) {
    var recomendedproduct =
        Get.find<RecomendedProductController>().recomendedProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(recomendedproduct, Get.find<CartController>());
    return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: Dimension.height25 * 3,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                      if(Page=="CartPage"){
                        Get.toNamed(RouteHelper.cartpage);
                    }else{
                       Get.toNamed(RouteHelper.getIntial());
                    }
                    },
                      child: AppIcon(icon: Icons.clear)),
                  //AppIcon(icon: Icons.shopping_cart_outlined),
                  GetBuilder<PopularProductController>(builder: (controller) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getCartPage());
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
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(20),
                child: Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.only(top: 5, bottom: 10),
                  // ignore: sort_child_properties_last
                  child: Center(
                      child: BigText(
                    text: recomendedproduct.name,
                    size: Dimension.font26,
                  )),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                ),
              ),
              pinned: true,
              backgroundColor: AppColors.mainColor,
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  width: double.maxFinite,
                  AppConstants.BASEURL +
                      AppConstants.UPLOADURL +
                      recomendedproduct.img!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: Dimension.height20,
                        left: Dimension.width20,
                        right: Dimension.width20),
                    child: ExpandableText(text: recomendedproduct.description),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: GetBuilder<PopularProductController>(
          builder: (controller) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      left: Dimension.width20 * 2.5,
                      right: Dimension.width20 * 2.5,
                      top: Dimension.height10,
                      bottom: Dimension.height10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            controller.setQuantity(false);
                          },
                          child: AppIcon(
                            icon: Icons.remove,
                            backgroundcolor: AppColors.mainColor,
                            iconcolor: Colors.white,
                            iconsize: Dimension.iconSize24,
                          )),
                      BigText(
                          text:
                              "Rs ${recomendedproduct.price} X ${controller.inCartItems}",
                          size: Dimension.font26),
                      GestureDetector(
                          onTap: () {
                            controller.setQuantity(true);
                          },
                          child: AppIcon(
                            icon: Icons.add,
                            backgroundcolor: AppColors.mainColor,
                            iconcolor: Colors.white,
                            iconsize: Dimension.iconSize24,
                          )),
                    ],
                  ),
                ),
                Container(
                  height: Dimension.height120,
                  padding: EdgeInsets.only(
                    left: Dimension.width20,
                    right: Dimension.width20,
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
                          borderRadius:
                              BorderRadius.circular(Dimension.radius20),
                        ),
                        padding: EdgeInsets.only(
                          left: Dimension.width20,
                          right: Dimension.width20,
                          top: Dimension.height20,
                          bottom: Dimension.height20,
                        ),
                        child: Icon(
                          Icons.favorite,
                          color: AppColors.mainColor,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.addItem(recomendedproduct);
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                            left: Dimension.width20,
                            right: Dimension.width20,
                            top: Dimension.height20,
                            bottom: Dimension.height20,
                          ),
                          child: BigText(
                              text:
                                  "\Rs ${recomendedproduct.price} | Add to cart"),
                          decoration: BoxDecoration(
                            color: AppColors.mainColor,
                            borderRadius:
                                BorderRadius.circular(Dimension.radius20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ));
  }
}
