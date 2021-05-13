import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportify/controllers/authController.dart';

class EmailInputField extends StatelessWidget {
  final AuthController controller = Get.find();
  EmailInputField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var inputDecoration = InputDecoration(
      hintText: 'Enter your username',

      fillColor: Colors.white70,
      // filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(
          width: 2,
          color: Colors.white,
        ),
      ),
      isDense: true,
      prefixIcon: Icon(Icons.email),
    );
    return Material(
      elevation: 5.0,
      shadowColor: Colors.black45,
      borderRadius: BorderRadius.circular(8),
      child: TextFormField(
        style: TextStyle(color: Colors.black54),
        keyboardType: TextInputType.emailAddress,
        controller: controller.emailController,
        validator: (String value) {
          if (!GetUtils.isEmail(value)) {
            return 'Enter valid email';
          } else if (value == null || value.isEmpty) {
            return 'Please enter valid characters';
          } else {
            print(value);
            return null;
          }
        },
        decoration: inputDecoration,
      ),
    );
  }
}

class PasswordInputField extends StatelessWidget {
  final AuthController controller = Get.find();
  PasswordInputField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var inputDecoration = InputDecoration(
      hintText: 'Enter your Password',
      fillColor: Colors.white70,
      // filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(
          width: 2,
          color: Colors.white,
        ),
      ),
      isDense: true,
      prefixIcon: Icon(Icons.security_rounded),
    );
    return Material(
      elevation: 5.0,
      shadowColor: Colors.black45,
      borderRadius: BorderRadius.circular(8),
      child: TextFormField(
        style: TextStyle(color: Colors.black54),
        controller: controller.passWordController,
        obscureText: true,
        validator: (String value) {
          if (value == null || value.isEmpty) {
            return 'Please enter valid characters';
          } else {
            print(value);
            return null;
          }
        },
        decoration: inputDecoration,
      ),
    );
  }
}
