import 'package:flutter/material.dart';
import 'package:samman_bazzar/tools/dimension.dart';

// ignore: must_be_immutable
class BigText extends StatelessWidget {
   Color? color;
  final String text;
  final double size;
  TextOverflow overflow;
  BigText({
    super.key,
    this.color = const Color(0xFF332d2b),
    required this.text,
    this.size = 0.0,
    this.overflow = TextOverflow.ellipsis,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: color,
        fontSize: size == 0 ? Dimension.font20:size,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}