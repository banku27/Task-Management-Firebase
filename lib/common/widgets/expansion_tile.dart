import 'package:flutter/material.dart';
import 'package:todo_with_firebase/common/utils/constants.dart';
import 'package:todo_with_firebase/common/widgets/titles.dart';

class ExpandsionTile extends StatelessWidget {
  final String text;
  final String text2;
  const ExpandsionTile({super.key, required this.text, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppConstants.kBkLight,
        borderRadius: BorderRadius.all(
          Radius.circular(AppConstants.kRadius),
        ),
      ),
      child: Theme(
          data: Theme.of(context).copyWith(
            dividerColor: Colors.transparent,
          ),
          child: ExpansionTile(
              title: BottomTitles(
            text: text,
            text2: text2,
          ))),
    );
  }
}
