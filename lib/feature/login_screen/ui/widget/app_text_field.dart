import 'package:chat_me/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required this.textEditingController,
    required this.labelText,
    this.suffixIcon,
  });

  final String labelText;
  final Widget? suffixIcon;
  final TextEditingController textEditingController;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: TextField(
        controller: widget.textEditingController,
        obscureText: false,
        decoration: InputDecoration(
          labelText: widget.labelText.tr,
          // labelStyle: TextStyles.font14DarkBlueboldCairo,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorsManager.Amber, width: 2.0.w),
            borderRadius: BorderRadius.circular(20.r),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          suffixIcon: widget.suffixIcon,
        ),
      ),
    );
  }
}
