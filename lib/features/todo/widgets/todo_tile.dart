import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_with_firebase/common/utils/constants.dart';
import 'package:todo_with_firebase/common/widgets/app_style.dart';
import 'package:todo_with_firebase/common/widgets/height_spacer.dart';
import 'package:todo_with_firebase/common/widgets/reusable_text.dart';
import 'package:todo_with_firebase/common/widgets/width_spacer.dart';

class TodoTile extends StatelessWidget {
  const TodoTile(
      {super.key,
      this.color,
      this.title,
      this.description,
      this.start,
      this.end,
      this.editWidget,
      this.delete});

  final Color? color;
  final String? title;
  final String? description;
  final String? start;
  final String? end;
  final Widget? editWidget;
  final VoidCallback? delete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            width: AppConstants.kWidth,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(AppConstants.kRadius),
                ),
                color: AppConstants.kGreyLight),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 80,
                      width: 5,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(AppConstants.kRadius),
                        //todo dynamic colors
                        color: color ?? AppConstants.kRed,
                      ),
                    ),
                    const WidthSpacer(width: 15),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: SizedBox(
                        width: AppConstants.kWidth * 0.6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ReusableText(
                                text: title ?? 'Title of todo',
                                style: appstyle(
                                    18, AppConstants.kLight, FontWeight.bold)),
                            const HeightSpacer(size: 3),
                            ReusableText(
                              text: description ?? 'Description of Todo',
                              style: appstyle(
                                  12, AppConstants.kLight, FontWeight.bold),
                            ),
                            const HeightSpacer(size: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: AppConstants.kWidth * 0.3,
                                  height: 25.h,
                                  decoration: BoxDecoration(
                                    color: AppConstants.kBkDark,
                                    border: Border.all(
                                        width: 0.3,
                                        color: AppConstants.kGreyDk),
                                    borderRadius: BorderRadius.circular(
                                        AppConstants.kRadius),
                                  ),
                                  child: Center(
                                      child: ReusableText(
                                          text: '$start | $end',
                                          style: appstyle(
                                              12,
                                              AppConstants.kLight,
                                              FontWeight.normal))),
                                ),
                                const WidthSpacer(width: 20),
                                Row(
                                  children: [
                                    SizedBox(
                                      child: editWidget,
                                    ),
                                    const WidthSpacer(width: 20),
                                    GestureDetector(
                                      onTap: delete,
                                      child: const Icon(Icons.delete),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
