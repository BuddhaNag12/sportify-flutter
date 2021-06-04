import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sportify/constants/colorConst.dart';
import 'package:sportify/constants/responsiveConst.dart';
import 'package:sportify/global_widgets/appbar.dart';
import 'package:sportify/widgets/eventInputField.dart';
import 'package:sportify/controllers/joinEventController.dart';

class JoinEventsScreen extends StatelessWidget {
  final JoinEventController con = Get.put(JoinEventController());
  //TODO: implement join event screen

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
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        color: primaryColor,
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
                          color: primaryColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade800,
                              blurRadius: 4.0,
                              spreadRadius: 1.0,
                              offset: Offset(1.0, 5.0),
                            ),
                          ],
                        ),
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          'assets/join-evt.svg',
                          height: 85,
                          width: 85,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    width: width,
                    height: height,
                    color: Theme.of(context).primaryColor,
                    child: SingleChildScrollView(
                      child: Form(
                        key: con.jformKey,
                        child: Column(
                          children: [
                            Container(
                              width: width - 40,
                              height: 500,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  EventInputField(
                                    controller: con.cJeventName,
                                    fieldName: 'Your Name',
                                    isDescription: false,
                                    isNum: false,
                                  ),
                                  EventInputField(
                                    controller: con.cJteamName,
                                    fieldName: 'Team Name',
                                    isDescription: false,
                                    isNum: false,
                                  ),
                                  EventInputField(
                                    controller: con.cJeventDescription,
                                    fieldName: 'Contact Number',
                                    isDescription: false,
                                    isNum: true,
                                  ),
                                  EventInputField(
                                    controller: con.cJeventDescription,
                                    fieldName: 'Short Message',
                                    isDescription: true,
                                    isNum: false,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (con.jformKey.currentState
                                            .validate()) {
                                          // Process data.
                                        }
                                      },
                                      child: const Text('Confirm'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
