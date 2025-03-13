import 'package:chat_me/core/helper/spaces.dart';
import 'package:chat_me/core/widget/app_buttom.dart';
import 'package:chat_me/feature/login_screen/ui/widget/app_text_field.dart';
import 'package:chat_me/feature/login_screen/ui/widget/login_image_fac.dart';
import 'package:chat_me/feature/login_screen/ui/widget/or_and_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscured = true;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            LoginImageFac(),
            AppTextField(
              textEditingController: emailController,
              labelText: 'email',
            ),
            verticalSpace(25.h),
            AppTextField(
              textEditingController: passwordController,
              labelText: 'password',
              suffixIcon: IconButton(
                icon:
                    Icon(isObscured ? Icons.visibility_off : Icons.visibility),
                onPressed: () {
                  setState(() {
                    isObscured = !isObscured;
                  });
                },
              ),
            ),
            verticalSpace(50),
            AppButtom(
              onPressed: () {},
              buttonText: "login",
            ),
            OrAndDivider(),
            AppButtom(
              onPressed: () {},
              buttonText: "sign_up",
            ),
          ],
        ),
      ),
    );
  }
}
