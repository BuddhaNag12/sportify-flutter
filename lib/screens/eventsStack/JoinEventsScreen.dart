import 'package:sportify/screens/exports/createEventExport.dart';

import '../exports/joinEvtExports.dart';

class JoinEventsScreen extends StatelessWidget {
  final JoinEventController con = Get.put(JoinEventController());
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
                    cirCularIcon(
                      imgPath: 'assets/join-evt.svg',
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
                              width: paddedWidth,
                              height: 450,
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
                                    fieldStyle: subtitle3,
                                  ),
                                  EventInputField(
                                    controller: con.cJteamName,
                                    fieldName: 'Team Name',
                                    isDescription: false,
                                    isNum: false,
                                    fieldStyle: subtitle3,
                                  ),
                                  EventInputField(
                                    controller: con.cjcontactForm,
                                    fieldName: 'Contact Number',
                                    isDescription: false,
                                    isNum: true,
                                    fieldStyle: subtitle3,
                                  ),
                                  EventInputField(
                                    controller: con.cJeventDescription,
                                    fieldName: 'Short Message',
                                    isDescription: true,
                                    isNum: false,
                                    fieldStyle: subtitle3,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (con.jformKey.currentState
                                            .validate()) {
                                          // Process data.
                                          con.applyEvent();
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
