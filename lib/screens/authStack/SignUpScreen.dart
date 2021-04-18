import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
// import 'package:flutter_icons/flutter_icons.dart';
import 'package:sportify/global_widgets/InputField.dart';
import 'package:sportify/global_widgets/appbar.dart';

class SignUpScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: MyAppBar(
        isTransparent: false,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.tealAccent.shade700,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox(
                    height: 100,
                    child: Text("Sign Up",
                        style: Theme.of(context).textTheme.headline1),
                  ),
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Positioned(
                      top: -80,
                      left: 135,
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).primaryColor,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade800,
                                  blurRadius: 4.0,
                                  spreadRadius: 1.0,
                                  offset: Offset(1.0, 5.0)),
                            ]),
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          'assets/signUp.svg',
                          height: 90,
                          width: 100,
                          // alignment: Alignment.center,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Theme.of(context).primaryColor,
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width - 40,
                              height: 230,
                              // color: Colors.grey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  new InputField(isUserName: true),
                                  new InputField(isUserName: false),
                                  Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (_formKey.currentState.validate()) {
                                          // Process data.
                                        }
                                      },
                                      child: const Text('Sign Up'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                "Already have an account?",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () => Get.back(),
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                    color: Colors.white,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     Padding(
                            //         padding: const EdgeInsets.all(8.0),
                            //         child: ElevatedButton.icon(
                            //             onPressed: () => {},
                            //             icon: Icon(FlutterIcons.google_ant),
                            //             label: Text("Google sign in"))),
                            //     Padding(
                            //         padding: const EdgeInsets.all(8.0),
                            //         child: ElevatedButton.icon(
                            //             onPressed: () => {},
                            //             icon: Icon(FlutterIcons.facebook_ent),
                            //             label: Text("Facebook Sign in"))),
                            //   ],
                            // )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
