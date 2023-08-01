import 'package:flutter/material.dart';
import 'package:todo_with_firebase/common/utils/constants.dart';

import 'app_style.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hintText,
      required this.keyboardType,
      this.validator,
      this.suffixIcon,
      this.onChanged,
      this.prefixIcon,
      required this.controller});

  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppConstants.kWidth * 0.9,
      decoration: BoxDecoration(
        color: AppConstants.kLight,
        borderRadius: BorderRadius.all(
          Radius.circular(AppConstants.kRadius),
        ),
      ),
      child: TextFormField(
        keyboardType: keyboardType,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: suffixIcon,
          suffixIconColor: AppConstants.kBkDark,
          prefixIcon: prefixIcon,
          hintStyle:
              appstyle(14, Color(AppConstants.kBkDark.value), FontWeight.w500),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 0.5,
            ),
            borderRadius: BorderRadius.zero,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 0,
            ),
            borderRadius: BorderRadius.zero,
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(AppConstants.kRed.value),
              width: 0.5,
            ),
            borderRadius: BorderRadius.zero,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(AppConstants.kBkDark.value),
              width: 0.5,
            ),
            borderRadius: BorderRadius.zero,
          ),
          border: InputBorder.none,
        ),
        controller: controller,
        cursorHeight: 25,
        style: appstyle(18, Color(AppConstants.kBkDark.value), FontWeight.w700),
        validator: validator,
      ),
    );
  }
}
