import 'package:firebase_getx_auth/screens/login_screen.dart';
import 'package:firebase_getx_auth/screens/sign_up_screen.dart';
import 'package:get/get.dart';

import '../screens/home_screen.dart';
import '../screens/splash_screen.dart';

class RouteHelper {
  static const String initial = '/';
  static const String login = '/login-page';
  static const String signup = '/signup-page';
  static const String splash = '/splash-page';

//methods
  static String getSplashScreen() => "$splash";
  static String getInitialScreen(String? email) => "$initial?email=$email";
  static String getLoginScreen() => "$login";
  static String getSignUpScreen() => "$signup";

  static List<GetPage> getPages = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(
        name: initial,
        page: () {
          var email = Get.parameters['email'];
          return HomeScreen(email: email!);
        }),
    GetPage(name: login, page: () => const LoginScreen()),
    GetPage(name: signup, page: () => const SignUpScreen()),
  ];
}
