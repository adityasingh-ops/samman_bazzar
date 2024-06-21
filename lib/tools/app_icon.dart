import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color iconcolor;
  final Color backgroundcolor;
  final double size;
  final double iconsize;
  AppIcon({
    super.key,
    required this.icon,
    this.backgroundcolor = const Color(0xFFfcf4e4),
    this.iconcolor = const Color(0xFF564d2b),
    this.size = 40,
    this.iconsize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundcolor,
        borderRadius: BorderRadius.circular(size / 2),
      ),
      child: Icon(
        icon,
        color: iconcolor,
        size:iconsize,
        
      ),
    );
  }
}
