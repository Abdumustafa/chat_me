import 'package:chat_me/core/helper/spaces.dart';
import 'package:chat_me/core/widget/app_buttom.dart';
import 'package:chat_me/feature/login_screen/ui/widget/app_text_field.dart';
import 'package:chat_me/feature/login_screen/ui/widget/login_image_fac.dart';
import 'package:chat_me/feature/register_screen/ui/widget/snack_bar_app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isObscured = true;
  String? email,password;
  bool inAsyncCall = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: inAsyncCall,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                LoginImageFac(),
                AppTextField(
                  labelText: 'email',
                  onChanged: (data) {
                    email = data;
                  },
                ),
                verticalSpace(25.h),
                AppTextField(
                  onChanged: (data) {
                    password = data;
                  },
                  labelText: 'password',
                  suffixIcon: IconButton(
                    icon: Icon(
                        isObscured ? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        isObscured = !isObscured;
                      });
                    },
                  ),
                ),
                verticalSpace(50),
                AppButtom(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      setState(() {
                        inAsyncCall = true;
                      });
                      try {
                        await regesterUser();
                        snackBar(context, "Success");
                      } on FirebaseAuthException catch (ex) {
                        if (ex.code == 'weak-password') {
                          snackBar(
                              context, "The password provided is too weak.");
                        } else if (ex.code == 'email-already-in-use') {
                          snackBar(context,
                              "The account already exists for that email.");
                        } else {
                          snackBar(context, "Error");
                        }
                      } catch (e) {
                        snackBar(context, "Error");
                      }
                      setState(() {
                        inAsyncCall = false;
                      });
                    }
                  },
                  buttonText: "sign_up",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

 

  Future<void> regesterUser() async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
