import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginImageFac extends StatelessWidget {
  const LoginImageFac({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 30.h),
        decoration: BoxDecoration(),
        child: Image.asset(
          "assets/images/scholar.png",
          height: 200,
        ));
  }
}
