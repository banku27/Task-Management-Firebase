import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_with_firebase/common/utils/constants.dart';
import 'package:todo_with_firebase/common/widgets/app_style.dart';
import 'package:todo_with_firebase/common/widgets/height_spacer.dart';
import 'package:todo_with_firebase/common/widgets/reusable_text.dart';
import 'package:todo_with_firebase/common/widgets/width_spacer.dart';

class BottomTitles extends StatelessWidget {
  final String text;
  final String text2;
  final Color? color;
  const BottomTitles(
      {super.key, required this.text, required this.text2, this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppConstants.kWidth,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Consumer(builder: (context, ref, child) {
              return Container(
                height: 80,
                width: 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppConstants.kRadius),
                  //todo dynamic colors
                  color: AppConstants.kGreen,
                ),
              );
            }),
            const WidthSpacer(width: 15),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(
                    text: text,
                    style: appstyle(24, AppConstants.kLight, FontWeight.bold),
                  ),
                  const HeightSpacer(size: 10),
                  ReusableText(
                    text: text2,
                    style: appstyle(12, AppConstants.kLight, FontWeight.normal),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
