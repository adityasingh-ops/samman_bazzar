import 'package:flutter/material.dart';
import 'package:samman_bazzar/Pages/HomePage/food_page_body.dart';
import 'package:samman_bazzar/tools/dimension.dart';
import 'package:samman_bazzar/tools/large_text.dart';
import 'package:samman_bazzar/tools/small_text.dart';
import 'package:samman_bazzar/tools/colors.dart';

class MainItemPage extends StatefulWidget {
  const MainItemPage({super.key});

  @override
  State<MainItemPage> createState() => _MainItemPageState();
}

class _MainItemPageState extends State<MainItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(top: Dimension.height45, bottom: Dimension.height15),
              padding: EdgeInsets.only(left: Dimension.width20, right: Dimension.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(
                        text: "Bengalore",
                        color: AppColors.mainColor,
                      ),
                      Row(
                        children: [
                          SmallText(
                            text: "E.City",
                            color: Colors.black54,
                          ),
                          Icon(Icons.arrow_drop_down_rounded),
                        ],
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      height: Dimension.height45,
                      width: Dimension.width45,
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: Dimension.iconSize24,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.circular(Dimension.radius15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: SingleChildScrollView(child: ItemPageBody(),)),
        ],
      ),
    );
  }
}
