import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportify/constants/responsiveConst.dart';
import 'package:sportify/controllers/eventDetailsController.dart';
import 'package:sportify/global_widgets/appbar.dart';
import 'package:sportify/widgets/localWidgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sportify/controllers/eventController.dart';

class ViewEventScreen extends GetView<EventController> {
  final EventDetailsController _controllerForEvent = Get.find();
  final EventController _controllerForTab = Get.find();

  @override
  Widget build(BuildContext context) {
    var id = Get.parameters['id'];
    _controllerForEvent.viewEvent(id);

    return Obx(
      () => Scaffold(
        appBar: MyAppBar(
          isTransparent: false,
        ),
        backgroundColor: Colors.tealAccent.shade700,
        body: _controllerForEvent.isLoading.value == true
            ? shimmeringloading()
            : Container(
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
                        decoration:
                            BoxDecoration(shape: BoxShape.circle, boxShadow: [
                          BoxShadow(
                            blurRadius: 3,
                            spreadRadius: .5,
                            offset: Offset(0, 1),
                            color: Colors.grey.shade500,
                          )
                        ]),
                        child: ClipOval(
                            child: GetBuilder<EventDetailsController>(
                          builder: (eController) {
                            return GoogleMap(
                              mapType: MapType.hybrid,
                              initialCameraPosition:
                                  eController.initialMapPositionGooglePlex,
                              markers: Set.of((eController.marker != null)
                                  ? [eController.marker]
                                  : []),
                              onMapCreated: (GoogleMapController controller) {
                                eController.gmapController.complete(controller);
                                eController.addMarker(
                                  _controllerForEvent
                                      .evtDetails.location.latitude,
                                  _controllerForEvent
                                      .evtDetails.location.longitude,
                                );
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
                        controller: _controllerForTab.tabController,
                        tabs: [
                          Tab(
                            child: Text("Details".toUpperCase()),
                          ),
                          Tab(child: Text("More info".toUpperCase())),
                        ],
                        onTap: (int index) {
                          _controllerForTab.selectedIndex.value = index;
                          _controllerForTab.tabController.animateTo(index);
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
                                      '${_controllerForEvent.evtDetails.description}',
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 6,
                                    ),
                                  ),
                                ),
                                maintainState: true,
                                visible:
                                    _controllerForTab.selectedIndex.value == 0,
                              ),
                              Visibility(
                                child: Container(
                                  height: 120,
                                  child: Text(
                                    'about the Team it is open tournament for any participants to join it and play the tournament,lorem ipsm i slorem ipsm islorem ipsm islorem ipsm is lorem ipsm is',
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 6,
                                  ),
                                ),
                                maintainState: true,
                                visible:
                                    _controllerForTab.selectedIndex.value == 1,
                              ),
                            ],
                            index: _controllerForTab.selectedIndex.value,
                          ),
                        )),
                    SizedBox(
                      width: width - 100,
                      child: ElevatedButton(
                        onPressed: () => Get.toNamed('/join'),
                        child: Text(
                          "Join Event",
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
      ),
    );
  }
}
