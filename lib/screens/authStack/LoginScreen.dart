import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sportify/controllers/authController.dart';
// import 'package:sportify/controllers/global_Controller.dart';
import 'package:sportify/global_widgets/InputField.dart';
import 'package:sportify/global_widgets/appbar.dart';
import 'package:sportify/widgets/localWidgets.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthController eventStore = Get.find();

  @override
  Widget build(BuildContext context) {
    final double width = context.mediaQuery.size.width;
    final double height = context.mediaQuery.size.height;

    return Scaffold(
      appBar: MyAppBar(
        isTransparent: false,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Container(
          width: width,
          height: height,
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
                    child: Text("Sign In",
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
                          'assets/signIn.svg',
                          height: 110,
                          width: 120,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    width: width,
                    height: height,
                    color: Theme.of(context).primaryColor,
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Container(
                              width: width - 40,
                              height: 230,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  new EmailInputField(),
                                  new PasswordInputField(),
                                  Obx(
                                    () => Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: eventStore.isLoading.value == true
                                          ? CircularProgressIndicator()
                                          : ElevatedButton(
                                              onPressed: () {
                                                if (_formKey.currentState
                                                    .validate()) {
                                                  eventStore.signInWithEmail();
                                                  eventStore.reset();
                                                }
                                              },
                                              child: const Text('Log in'),
                                            ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            spacer(5.0),
                            Text(
                              "Don't Have an account?",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            TextButton(
                              onPressed: () => Get.toNamed('/signup'),
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                    color: Colors.white,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ElevatedButton.icon(
                                    onPressed: () => {},
                                    icon: Icon(FlutterIcons.google_ant),
                                    label: Text("Google sign in"),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ElevatedButton.icon(
                                    onPressed: () =>
                                        Get.changeTheme(ThemeData.dark()),
                                    icon: Icon(FlutterIcons.facebook_ent),
                                    label: Text("Facebook Sign in"),
                                  ),
                                ),
                              ],
                            )
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
