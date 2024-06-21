import 'package:flutter/material.dart';
import 'package:samman_bazzar/tools/dimension.dart';
import 'package:samman_bazzar/tools/small_text.dart';

class IconAndText extends StatelessWidget {
  final IconData icon;
  final double size;
  final String text;
  final Color iconColor;
  const IconAndText(
      {super.key,
      required this.icon,
      required this.text,
      required this.size,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size:Dimension.iconSize24,
        ),
        SizedBox(
          width: 4,
        ),
        SmallText(text: text),
      ],
    );
  }
}
