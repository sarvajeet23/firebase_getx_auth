import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.emailController,
    this.hintText,
    this.labelText,
  }) : super(key: key);

  final TextEditingController emailController;
  final String? hintText;
  final String? labelText;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      child: TextField(
        controller: emailController,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              width: 1,
              color: Colors.blueGrey,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              width: 1,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
