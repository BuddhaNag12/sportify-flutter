import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sportify/controllers/exports/event_exports.dart';
import 'package:sportify/screens/exports/createEventExport.dart';

class MyEventScreen extends StatelessWidget {
  MyEventScreen({Key key}) : super(key: key);
  final AuthController auth = Get.find();
  @override
  Widget build(BuildContext context) {
    Stream myEventsStream;
    if (auth.stateUser.value?.uid != null) {
      myEventsStream = events
          .where('user_id', isEqualTo: auth.stateUser.value.uid)
          .snapshots();
    }
    return Scaffold(
      appBar: MyAppBar(isTransparent: false),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          FlutterIcons.add_mdi,
        ),
        onPressed: () => Get.toNamed('/create'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: myEventsStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          return Container(
            width: width,
            height: 550,
            child: Obx(
              () => auth.stateUser.value?.uid == null
                  ? Container(
                      width: width,
                      height: 250,
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
                    )
                  : ListView(
                      children:
                          snapshot.data.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data = document.data();
                        print(data['name']);
                        return ListTile(
                          title: Text(
                            data['name'].toUpperCase() ?? '',
                            style: headline1,
                          ),
                          subtitle: Text(
                            data['place'] ?? '',
                            style: subtitle1.copyWith(color: Colors.black),
                          ),
                          leading: Icon(FlutterIcons.event_mdi),
                          trailing: Icon(FlutterIcons.edit_2_fea),
                        );
                      }).toList(),
                    ),
            ),
          );
        },
      ),
    );
  }
}
