import 'package:flutter/material.dart';
import 'package:samman_bazzar/tools/colors.dart';
import 'package:samman_bazzar/tools/icon_text.dart';
import 'package:samman_bazzar/tools/large_text.dart';
import 'package:samman_bazzar/tools/small_text.dart';
import 'package:samman_bazzar/tools/dimension.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text,size: Dimension.font26,),
        SizedBox(height: Dimension.height10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Wrap(
              children: List.generate(5, (index) {
                return Icon(
                  Icons.star,
                  color: AppColors.mainColor,
                  size: 15,
                );
              }),
            ),
            SizedBox(width: Dimension.width10),
            SmallText(
              text: "4.5 (200)",
            ),
            SizedBox(width: Dimension.width10),
            SmallText(
              text: "comments",
            ),
          ],
        ),
        SizedBox(height: Dimension.height10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndText(
                icon: Icons.circle_sharp,
                size: Dimension.iconSize24,
                text: "Normal",
                iconColor: Colors.yellow),
            IconAndText(
                icon: Icons.location_on,
                text: "1.2",
                size: Dimension.iconSize24,
                iconColor: AppColors.mainColor),
            IconAndText(
                icon: Icons.timer_outlined,
                text: "32 min",
                size: Dimension.iconSize24,
                iconColor: Colors.red),
          ],
        ),
      ],
    );
  }
}
