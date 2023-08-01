import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_with_firebase/common/utils/constants.dart';
import 'package:todo_with_firebase/common/widgets/app_style.dart';
import 'package:todo_with_firebase/common/widgets/custom_outline_button.dart';
import 'package:todo_with_firebase/common/widgets/custom_text_field.dart';
import 'package:todo_with_firebase/common/widgets/height_spacer.dart';
import 'package:todo_with_firebase/common/widgets/reusable_text.dart';

import 'otp_page.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  Country country = Country(
      phoneCode: "+91",
      countryCode: "IN",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: 'IND',
      example: 'IND',
      displayName: "INDIA",
      displayNameNoCountryCode: "IN",
      e164Key: "");
  final TextEditingController phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Image.asset(
                  'assets/todo.png',
                ),
              ),
              const HeightSpacer(size: 20),
              Container(
                padding: EdgeInsets.only(left: 10.w),
                alignment: Alignment.center,
                child: ReusableText(
                    text: 'Please enter your phone number',
                    style: appstyle(17, AppConstants.kLight, FontWeight.w500)),
              ),
              const HeightSpacer(size: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomTextField(
                    hintText: 'Enter phone number',
                    keyboardType: TextInputType.phone,
                    controller: phone,
                    prefixIcon: Container(
                      padding: const EdgeInsets.all(14),
                      child: GestureDetector(
                        onTap: () {
                          showCountryPicker(
                              context: context,
                              countryListTheme: CountryListThemeData(
                                  bottomSheetHeight: AppConstants.kHeight * 0.6,
                                  borderRadius: BorderRadius.only(
                                    topLeft:
                                        Radius.circular(AppConstants.kRadius),
                                    topRight:
                                        Radius.circular(AppConstants.kRadius),
                                  ),
                                  backgroundColor: AppConstants.kLight),
                              onSelect: (code) {
                                setState(() {});
                              });
                        },
                        child: ReusableText(
                            text: "${country.flagEmoji}${country.phoneCode}",
                            style: appstyle(
                                18, AppConstants.kBkDark, FontWeight.bold)),
                      ),
                    )),
              ),
              const HeightSpacer(size: 10),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: CustomOutlineButton(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OtpPage()));
                  },
                  width: AppConstants.kWidth * 0.9,
                  height: AppConstants.kHeight * 0.07,
                  text: 'Send Code',
                  color: AppConstants.kBkDark,
                  color2: AppConstants.kLight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
