import 'package:chat_me/core/routing/router.dart';
import 'package:chat_me/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChatApp extends StatelessWidget {
 const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: GetMaterialApp(
        getPages: AppRouter.routes,
        initialRoute: AppRouter.initialRoute,
        title: "ItqanApp",
        theme: ThemeData(
          primaryColor: ColorsManager.Amber,  
        ),
        debugShowCheckedModeBanner: false,
      
      ),
    );
  }
}
