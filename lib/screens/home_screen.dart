import 'package:firebase_getx_auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, required this.email}) : super(key: key);

  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 250,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/login.png'))),
          ),
          Text(
            'Welcome',
            style: TextStyle(fontSize: 26),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            email,
            style: TextStyle(fontSize: 26),
          ),
          ElevatedButton(
              onPressed: () => AuthController.instance..logOut(),
              child: Text('Logout'))
        ],
      ),
    );
  }
}
