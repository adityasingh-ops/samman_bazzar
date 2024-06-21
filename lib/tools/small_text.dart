import 'package:flutter/material.dart';
import 'package:samman_bazzar/tools/dimension.dart';

// ignore: must_be_immutable
class SmallText extends StatelessWidget {
   Color? color;
  final String text;
  double size;
  double height;

  SmallText({
    super.key,
    this.color = const Color(0xFFccc7c5),
    required this.text,
    this.size = 12.0,
    this.height = 1.2,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: color,
        fontSize: Dimension.font12,
        height: height,
      ),
    );
  }
}