import 'package:flutter/material.dart';
import 'package:todo_with_firebase/common/utils/constants.dart';
import 'package:todo_with_firebase/common/widgets/titles.dart';

class ExpandsionTile extends StatelessWidget {
  final String text;
  final String text2;
  final void Function(bool)? onExpansionChanged;
  final List<Widget> children;
  final Widget? trailing;
  const ExpandsionTile(
      {super.key,
      required this.text,
      required this.text2,
      this.onExpansionChanged,
      required this.children,
      this.trailing});

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
          tilePadding: EdgeInsets.zero,
          childrenPadding: EdgeInsets.zero,
          trailing: trailing,
          onExpansionChanged: onExpansionChanged,
          controlAffinity: ListTileControlAffinity.trailing,
          title: BottomTitles(
            text: text,
            text2: text2,
          ),
          children: children,
        ),
      ),
    );
  }
}
