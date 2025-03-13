import 'package:chat_me/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ForgetPssword extends StatelessWidget {
  const ForgetPssword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 15.w,
        left: 15.w,
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(
                left: 20.w, right: 20.w, top: 10.h, bottom: 20.h),
            child: GestureDetector(
              child: Text(
                "forget_password".tr,
                // style: TextStyles.font14DarkBluemediumCairo,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
