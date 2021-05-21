import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:sportify/constants/firebaseConstants.dart';
import 'package:sportify/constants/responsiveConst.dart';
import 'package:sportify/global_widgets/appbar.dart';
import 'package:sportify/widgets/localWidgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sportify/controllers/eventController.dart';

class ViewEventScreen extends GetView<EventController> {
  final EventController _con = Get.find();

  @override
  Widget build(BuildContext context) {
    var id = Get.parameters['id'];
    _con.viewEvent(id);

    return Scaffold(
      appBar: MyAppBar(
        isTransparent: false,
      ),
      backgroundColor: Colors.tealAccent.shade700,
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        width: width,
        height: height,
        child: Column(
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                margin: EdgeInsets.only(top: 5),
                width: 200,
                height: 200,
                decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                  BoxShadow(
                    blurRadius: 3,
                    spreadRadius: .5,
                    offset: Offset(0, 1),
                    color: Colors.grey.shade500,
                  )
                ]),
                child: ClipOval(child: GetBuilder<EventController>(
                  builder: (eController) {
                    return GoogleMap(
                      mapType: MapType.hybrid,
                      initialCameraPosition: eController.kGooglePlex,
                      markers: Set.of((eController.marker != null)
                          ? [eController.marker]
                          : []),
                      onMapCreated: (GoogleMapController controller) {
                        eController.gmapController.complete(controller);
                        eController.addMarker();
                      },
                    );
                  },
                )),
              ),
            ),
            spacer(5),
            Obx(
              () => headerCard(width, context),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: TabBar(
                controller: _con.tabController,
                tabs: [
                  Tab(
                    child: Text("Details".toUpperCase()),
                  ),
                  Tab(child: Text("More info".toUpperCase())),
                ],
                onTap: (int index) {
                  _con.selectedIndex.value = index;
                  _con.tabController.animateTo(index);
                },
              ),
            ),
            Container(
                padding: EdgeInsets.all(5.0),
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Obx(
                  () => IndexedStack(
                    children: <Widget>[
                      Visibility(
                        child: Container(
                          height: 120,
                          child: Obx(
                            () => Text(
                              '${_con.evtDetails.description}',
                              style: Theme.of(context).textTheme.headline6,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 6,
                            ),
                          ),
                        ),
                        maintainState: true,
                        visible: _con.selectedIndex.value == 0,
                      ),
                      Visibility(
                        child: Container(
                          height: 120,
                          child: Text(
                            'about the Team it is open tournament for any participants to join it and play the tournament,lorem ipsm i slorem ipsm islorem ipsm islorem ipsm is lorem ipsm is',
                            style: Theme.of(context).textTheme.headline6,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 6,
                          ),
                        ),
                        maintainState: true,
                        visible: _con.selectedIndex.value == 1,
                      ),
                    ],
                    index: _con.selectedIndex.value,
                  ),
                )),
            SizedBox(
              width: width - 100,
              child: ElevatedButton(
                onPressed: () => {},
                child: Text(
                  "Join Tournament",
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.8,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
