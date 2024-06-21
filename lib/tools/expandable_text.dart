import 'package:flutter/material.dart';
import 'package:samman_bazzar/tools/colors.dart';
import 'package:samman_bazzar/tools/dimension.dart';
import 'package:samman_bazzar/tools/small_text.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  const ExpandableText({super.key, required this.text});

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firsthalf;
  late String secondhalf;
  bool flag = true;
  double textheight =Dimension.screenHeight/5;
  @override
  void initState() {
    super.initState();
    if (widget.text.length > textheight) {
      firsthalf = widget.text.substring(0, textheight.toInt());
      secondhalf = widget.text.substring(textheight.toInt()+1, widget.text.length);
    } else {
      firsthalf = widget.text;
      secondhalf = "";
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondhalf.isEmpty?SmallText(text: firsthalf,size: Dimension.font16,color: AppColors.textColor,):Column(
        children: [
          SmallText(text:flag?firsthalf + "...":firsthalf + secondhalf,size: Dimension.font16,color: AppColors.textColor,height: 1.8,),
          InkWell(
            onTap: (){
              setState(() {
                flag = !flag;
              });
            },
            child: Row(
              children: [
                SmallText(text:flag?"Read More":"Read Less",color: AppColors.mainColor,size:Dimension.font16),
                Icon(flag?Icons.arrow_drop_down:Icons.arrow_drop_up,color: AppColors.mainColor,size: Dimension.iconSize24,),
              ],
            ),
          ),
        ],
      )
    );
  }
}