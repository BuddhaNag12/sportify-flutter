import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportify/constants/typographyConstants.dart';
import 'package:sportify/controllers/authController.dart';

class EmailInputField extends StatelessWidget {
  final isPasswordField;
  final label;
  final con;
  final color;
  final enabled;
  EmailInputField({
    this.isPasswordField = false,
    @required this.label,
    @required this.con,
    this.color,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 2),
            margin: const EdgeInsets.only(bottom: 5),
            child: Text(
              label.toString(),
              style: subtitle1.copyWith(color: this.color),
            ),
          ),
          Material(
            elevation: 5.0,
            shadowColor: Colors.black45,
            borderRadius: BorderRadius.circular(4),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextFormField(
                enabled: enabled,
                style: TextStyle(color: Colors.black54),
                keyboardType:
                    !isPasswordField ? TextInputType.emailAddress : null,
                controller: con,
                obscureText: isPasswordField ? true : false,
                validator: (String value) {
                  if (isPasswordField) {
                    var msg;
                    if (GetUtils.isLengthLessThan(value, 6)) {
                      msg = 'Enter valid Password minimum 6 characters';
                    } else {
                      msg = null;
                    }
                    return msg;
                  } else if (!GetUtils.isEmail(value)) {
                    return 'Please enter valid Email';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  isDense: true,
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  prefixIcon: isPasswordField
                      ? Icon(Icons.security_rounded)
                      : Icon(Icons.email),
                  labelText: 'Enter your ${label}',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class PasswordInputField extends StatelessWidget {
//   final AuthController controller = Get.find();
//   PasswordInputField({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var inputDecoration = InputDecoration(
//       hintText: 'Enter your Password',
//       fillColor: Colors.white70,
//       // filled: true,
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.all(Radius.circular(8)),
//         borderSide: BorderSide(
//           width: 2,
//           color: Colors.white,
//         ),
//       ),
//       isDense: true,
//       prefixIcon: Icon(Icons.security_rounded),
//     );
//     return Material(
//       elevation: 5.0,
//       shadowColor: Colors.black45,
//       borderRadius: BorderRadius.circular(8),
//       child: TextFormField(
//         style: TextStyle(color: Colors.black54),
//         controller: controller.passWordController,
//         obscureText: true,
//         validator: (String value) {
//           if (value == null || value.isEmpty) {
//             return 'Please enter valid characters';
//           } else {
//             print(value);
//             return null;
//           }
//         },
//         decoration: inputDecoration,
//       ),
//     );
//   }
// }
