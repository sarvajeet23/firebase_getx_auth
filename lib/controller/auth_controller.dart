import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_getx_auth/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController instance = AuthController();

  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();

    _user = Rx<User?>(auth.currentUser);

    _user.bindStream(auth.userChanges());
    ever(_user, _initial);
  }

  _initial(User? user) {
    if (user == null) {
      Get.toNamed(RouteHelper.getLoginScreen());
      // print('login screen');
    } else {
      Get.toNamed(RouteHelper.getInitialScreen(user.email!));
      // print('home screen');
    }
  }

  void login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      // print('Logged in');
    } catch (e) {
      Get.snackbar(
        'About User',
        'User Message',
        backgroundColor: Colors.red,
        titleText: const Text(
          'Login Failled',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        messageText: Text(e.toString(),
            style: const TextStyle(
              color: Colors.white,
            )),
      );
    }
  }

  void register(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar(
        'About User',
        'User Message',
        backgroundColor: Colors.red,
        titleText: const Text(
          'Account creation Failled',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        messageText: Text(e.toString(),
            style: const TextStyle(
              color: Colors.white,
            )),
      );
    }
  }

  Future<void> logOut() async {
    await auth.signOut();
  }
}
