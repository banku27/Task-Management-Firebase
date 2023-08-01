import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:todo_with_firebase/common/utils/constants.dart';
import 'package:todo_with_firebase/common/widgets/app_style.dart';
import 'package:todo_with_firebase/common/widgets/height_spacer.dart';
import 'package:todo_with_firebase/common/widgets/reusable_text.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HeightSpacer(size: AppConstants.kHeight * 0.15),
              Image.asset(
                'assets/todo.png',
                width: AppConstants.kWidth * 0.5,
              ),
              const HeightSpacer(size: 26),
              ReusableText(
                  text: 'Enter your OTP',
                  style: appstyle(18, AppConstants.kLight, FontWeight.bold)),
              const HeightSpacer(size: 26),
              Pinput(
                length: 6,
                showCursor: true,
                onCompleted: (value) {
                  if (value.length == 6) {}
                },
                onSubmitted: (value) {
                  if (value.length == 6) {}
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}
