import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_getx_auth/controller/auth_controller.dart';
import 'package:firebase_getx_auth/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyB4HQGssxpLTpDBZNSoG1zn5u0OtLvJqDw',
    appId: '1:162313083115:android:56b2b5db29274ae36a46ae',
    messagingSenderId: 'sendid',
    projectId: 'authentication-f0538',
    storageBucket: 'fir-getx-auth-641a5.appspot.com',
  )).then((value) => Get.put(AuthController()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Firebase-Getx',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: LoginScreen(),
      initialRoute: RouteHelper.getSplashScreen(),
      getPages: RouteHelper.getPages,
    );
  }
}
