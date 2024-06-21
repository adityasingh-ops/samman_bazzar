import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samman_bazzar/Controllers/popuplar_prodet_controller.dart';
import 'package:samman_bazzar/Controllers/recomended_product_controller.dart';
import 'package:samman_bazzar/models/popular_product_model.dart';
import 'package:samman_bazzar/routes/routeshelper/route_helper.dart';
import 'package:samman_bazzar/tools/app_column.dart';
import 'package:samman_bazzar/tools/app_constans.dart';
import 'package:samman_bazzar/tools/colors.dart';
import 'package:samman_bazzar/tools/dimension.dart';
import 'package:samman_bazzar/tools/large_text.dart';
import 'package:samman_bazzar/tools/small_text.dart';

class ItemPageBody extends StatefulWidget {
  const ItemPageBody({super.key});

  @override
  State<ItemPageBody> createState() => _ItemPageBodyState();
}

class _ItemPageBodyState extends State<ItemPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var currpageValue = 0.0;
  final _scalefactor = 0.8;
  double _height = Dimension.PageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currpageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // slider section.................
        GetBuilder<PopularProductController>(builder:(popularproducts){
          return popularproducts.isLoading?Container(
            height: Dimension.PageView,
            child: PageView.builder(
                controller: pageController,
                itemCount: popularproducts.popularProductList.length,
                itemBuilder: (context, position) {
                  return _buildPageItem(position,popularproducts.popularProductList[position]);
                })):CircularProgressIndicator(
                  color: AppColors.mainColor,
                );
        }),

        // dots indicator section.................
        GetBuilder<PopularProductController>(builder:(popularproducts){
          return DotsIndicator(
          dotsCount: popularproducts.popularProductList.length<=0?1:popularproducts.popularProductList.length,
          position: currpageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimension.radius10)),
          ));
        
        }),

        //Recomended section.................

        SizedBox(height: Dimension.height30),
        Container(
          margin: EdgeInsets.only(left: Dimension.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(
                text: "Recommended",
              ),
              SizedBox(width: Dimension.width10),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(
                  text: ".",
                  color: Colors.black26,
                ),
              ),
              SizedBox(width: Dimension.width10),
              Container(
                  margin: const EdgeInsets.only(bottom: 4),
                  child: SmallText(text: "All items")),
            ],
          ),
        ),
        //Popular items section.................
        GetBuilder<RecomendedProductController>(builder: (recomendedProduct){
          return recomendedProduct.isLoading?ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: recomendedProduct.recomendedProductList.length<=0?1:recomendedProduct.recomendedProductList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.toNamed(RouteHelper.getRecomendedFood(index,"home"));
                }, 
                child: Container(
                  margin: EdgeInsets.only(
                      left: Dimension.width20,
                      right: Dimension.width20,
                      bottom: Dimension.height10),
                  child: Row(
                    children: [
                      // image container.................
                      Container(
                        height: Dimension.listviewimg120,
                        width: Dimension.listviewimg120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimension.radius20),
                          color: Color(0xFFf9a8a8),
                          image: DecorationImage(
                            image: NetworkImage(AppConstants.BASEURL+AppConstants.UPLOADURL+recomendedProduct.recomendedProductList[index].img!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // text container.................
                      Expanded(
                        child: Container(
                          height: Dimension.PageViewTextContainer,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(Dimension.radius20),
                              bottomRight: Radius.circular(Dimension.radius20),
                            ),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: Dimension.width10),
                            child: AppColumn(
                              text: recomendedProduct.recomendedProductList[index].name!,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }):CircularProgressIndicator(
              color: AppColors.mainColor,
            );
        })
      ],
    );
  }

  Widget _buildPageItem(int index,ProductModel popularProduct) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == currpageValue.floor()) {
      var curr_scale = 1 - (currpageValue - index) * (1 - _scalefactor);
      var currTrans = (1 - curr_scale) * _height / 2;
      matrix = Matrix4.diagonal3Values(1, curr_scale, 1)
        ..setTranslationRaw(0.0, currTrans, 0.0);
    } else if (index == currpageValue.floor() + 1) {
      var curr_scale =
          _scalefactor + (currpageValue - index + 1) * (1 - _scalefactor);
      var currTrans = (1 - curr_scale) * _height / 2;
      matrix = Matrix4.diagonal3Values(1, curr_scale, 1);
      matrix = Matrix4.diagonal3Values(1, curr_scale, 1)
        ..setTranslationRaw(0.0, currTrans, 0.0);
    } else if (index == currpageValue.floor() - 1) {
      var curr_scale = 1 - (currpageValue - index) * (1 - _scalefactor);
      var currTrans = (1 - curr_scale) * _height / 2;
      matrix = Matrix4.diagonal3Values(1, curr_scale, 1);
      matrix = Matrix4.diagonal3Values(1, curr_scale, 1)
        ..setTranslationRaw(0.0, currTrans, 0.0);
    } else {
      var curr_scale = 0.8;
      matrix = Matrix4.diagonal3Values(1, curr_scale, 1)
        ..setTranslationRaw(0, _height * (1 - _scalefactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteHelper.getPopularFood(index,"home"));
            },
              child: Container(
                height: Dimension.PageViewContainer,
                margin: EdgeInsets.only(
                    left: Dimension.width10, right: Dimension.width10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimension.radius30),
                  color: index.isEven ? Color(0xFF69c5df) : Color(0xFFf9a8a8),
                  image: DecorationImage(
                    image: NetworkImage(AppConstants.BASEURL+AppConstants.UPLOADURL+popularProduct.img!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimension.PageViewTextContainer,
              margin: EdgeInsets.only(
                  left: Dimension.width30,
                  right: Dimension.width30,
                  bottom: Dimension.height30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimension.radius30),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 0),
                  ),
                ],
              ),
              child: Container(
                padding: EdgeInsets.only(
                    top: Dimension.height15,
                    left: Dimension.width15,
                    right: Dimension.width15),
                child: AppColumn(
                  text: popularProduct.name!,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
