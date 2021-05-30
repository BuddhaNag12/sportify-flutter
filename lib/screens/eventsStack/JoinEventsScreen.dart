import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:sportify/constants/responsiveConst.dart';
import 'package:sportify/global_widgets/appbar.dart';
import 'package:sportify/widgets/localWidgets.dart';

class JoinEventsScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                    child: Text("Join the event".toUpperCase(),
                        style: Theme.of(context).textTheme.headline1),
                  ),
                ),
                cirCularIcon(imgPath: 'assets/join-evt.svg'),
                Expanded(
                  child: Container(
                    // padding: EdgeInsets.all(20),
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
                              // color: Colors.grey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Material(
                                    elevation: 5.0,
                                    shadowColor: Colors.black45,
                                    borderRadius: BorderRadius.circular(8),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.auto,
                                        labelText: 'Enter Your name',
                                        fillColor: Colors.white,
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (_formKey.currentState.validate()) {
                                          // Process data.
                                        }
                                      },
                                      child: const Text('Log in'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                "Don't Have an account?",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
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
                                        label: Text("Google sign in"))),
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton.icon(
                                        onPressed: () =>
                                            Get.changeTheme(ThemeData.dark()),
                                        icon: Icon(FlutterIcons.facebook_ent),
                                        label: Text("Facebook Sign in"))),
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
