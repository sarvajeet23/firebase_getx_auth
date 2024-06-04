import 'package:firebase_getx_auth/controller/auth_controller.dart';
import 'package:firebase_getx_auth/screens/sign_up_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/login.png'))),
            ),
            CustomTextField(
              emailController: emailController,
              hintText: 'Enter email',
              labelText: 'Email',
            ),
            CustomTextField(
              emailController: passwordController,
              hintText: 'Enter password',
              labelText: 'Password',
            ),
            const SizedBox(height: 12),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                height: 55,
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () {
                    AuthController.instance.login(
                      emailController.text.trim(),
                      passwordController.text.trim(),
                    );
                  },
                  child: const Text('Login'),
                )),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 12),
                child: RichText(
                  text: TextSpan(
                      text: 'Dont have account?',
                      style: const TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                            text: ' Create ',
                            recognizer: TapGestureRecognizer()
                              ..onTap =
                                  () => Get.to(() => const SignUpScreen()),
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ))
                      ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
