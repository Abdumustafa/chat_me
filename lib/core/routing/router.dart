
import 'package:chat_me/feature/login_screen/ui/screen/login_screen.dart';
import 'package:get/get.dart';


class AppRouter {
  static String initialRoute = '/login';

  static List<GetPage> routes = [

    GetPage(name: '/login', page: () => LoginScreen()),
  ];
}

