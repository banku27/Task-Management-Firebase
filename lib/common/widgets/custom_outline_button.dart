import 'package:flutter/material.dart';
import 'package:todo_with_firebase/common/widgets/reusable_text.dart';

import 'app_style.dart';

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton(
      {super.key,
      required this.width,
      required this.height,
      required this.text,
      this.onTap,
      required this.color,
      this.color2});
  final double width;
  final double height;
  final String text;
  final void Function()? onTap;
  final Color color;
  final Color? color2;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color2,
            border: Border.all(width: 1, color: color)),
        child: Center(
          child: ReusableText(
            text: text,
            style: appstyle(16, color, FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
