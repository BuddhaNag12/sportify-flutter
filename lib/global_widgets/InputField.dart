import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportify/controllers/global_Controller.dart';

class InputField extends StatelessWidget {
  final bool isUserName;
  final GlobalController controller = Get.find();
  InputField({Key key, @required this.isUserName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      shadowColor: Colors.black45,
      borderRadius: BorderRadius.circular(8),
      child: TextFormField(
        controller: this.isUserName
            ? controller.emailController
            : controller.passWordController,
        obscureText: this.isUserName ? false : true,
        validator: (String value) {
          if (value == null || value.isEmpty) {
            return 'Please enter valid characters';
          } else {
            print(value);
          }
          return null;
        },
        decoration: InputDecoration(
          hintText:
              this.isUserName ? 'Enter your username' : 'Enter your password',
          fillColor: Colors.white,
          filled: true,
          prefixIcon:
              Icon(this.isUserName ? Icons.email : Icons.security_rounded),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(
                width: 3,
                color: Colors.white10,
              )),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(
              width: 3,
              color: Colors.white10,
            ),
          ),
        ),
      ),
    );
  }
}

Widget textInputField(context, {String inputTitle}) {
  return Material(
    elevation: 5.0,
    shadowColor: Colors.black45,
    borderRadius: BorderRadius.circular(8),
    child: TextFormField(
      validator: (String value) {
        if (value == null || value.isEmpty) {
          return 'Please enter valid characters';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: 'Enter your $inputTitle',
        fillColor: Colors.white,
        filled: true,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(
              width: 3,
              color: Colors.white10,
            )),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            width: 3,
            color: Colors.white10,
          ),
        ),
      ),
    ),
  );
}
