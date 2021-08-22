import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sportify/controllers/exports/event_exports.dart';
import 'package:sportify/controllers/manage_events_controller.dart';
import 'package:sportify/screens/exports/createEventExport.dart';

class ManageEvents extends StatelessWidget {
  ManageEvents({Key key}) : super(key: key);
  final AuthController auth = Get.find();
  final ManageEventsController evts = Get.put(ManageEventsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        isTransparent: false,
        isMultiselect: evts.isDocsExist.value,
        title: "Manage Events",
      ),
      body: Obx(
        () => auth.stateUser?.value?.uid != null
            ? StreamBuilder<QuerySnapshot>(
                stream: events
                    .where('user_id', isEqualTo: auth.stateUser?.value?.uid)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.data.docs.length < 0) {
                    evts.isDocsExist.value = false;
                  }
                  return Container(
                    width: width,
                    height: height * 0.8,
                    child: snapshot.data.docs.length > 0
                        ? ListView(
                            children: snapshot.data.docs
                                .map((DocumentSnapshot document) {
                              Map<String, dynamic> data = document.data();
                              return ListTile(
                                  title: Text(
                                    data['name'].toUpperCase() ?? '',
                                    style: headline1,
                                  ),
                                  subtitle: Text(
                                    data['place'] ?? '',
                                    style:
                                        subtitle1.copyWith(color: Colors.black),
                                  ),
                                  leading: Icon(FlutterIcons.event_mdi),
                                  onLongPress: () => null,
                                  trailing: IconButton(
                                      onPressed: () =>
                                          {Get.toNamed('/edit/${data['id']}')},
                                      icon: Icon(FlutterIcons.edit_2_fea)));
                            }).toList(),
                          )
                        : Column(
                            children: [
                              Expanded(
                                child: Center(
                                  child: SvgPicture.asset(
                                    'assets/notFound.svg',
                                  ),
                                ),
                              ),
                              Text(
                                "No events found try adding one",
                              )
                            ],
                          ),
                  );
                },
              )
            : Container(
                width: width,
                height: height * 0.7,
                child: Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/notFound.svg',
                          width: 250,
                          height: 250,
                        ),
                      ),
                    ),
                    Text(
                      "Oops ... You Need To Login First",
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
