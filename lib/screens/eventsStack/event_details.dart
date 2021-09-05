import 'package:sportify/constants/colorConst.dart';
import 'package:sportify/constants/typographyConstants.dart';
import 'package:sportify/screens/exports/eventExport.dart';
import '../exports/viewEvtexport.dart';

class EventDetails extends GetView<EventController> {
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
        backgroundColor: primaryColor,
        body: _controllerForEvent.isLoading.value == true
            ? shimmeringloading()
            : _controllerForEvent.eventDetails.value != null
                ? Container(
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
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
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
                                  onMapCreated:
                                      (GoogleMapController controller) {
                                    eController.gmapController
                                        .complete(controller);
                                    eController.addMarker(
                                      _controllerForEvent.eventDetails.value
                                          ?.location?.latitude,
                                      _controllerForEvent.eventDetails.value
                                          ?.location?.longitude,
                                    );
                                  },
                                );
                              },
                            )),
                          ),
                        ),
                        Spacing.verticalSpacing(5),
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
                                      alignment: Alignment.topLeft,
                                      color: whiteLight,
                                      padding: EdgeInsets.all(5),
                                      child: Obx(
                                        () => Text(
                                          _controllerForEvent.eventDetails.value
                                                  ?.description ??
                                              '',
                                          style: subtitle2,
                                          textAlign: TextAlign.start,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 6,
                                        ),
                                      ),
                                    ),
                                    maintainState: true,
                                    visible:
                                        _controllerForTab.selectedIndex.value ==
                                            0,
                                  ),
                                  Visibility(
                                    child: Container(
                                      height: 120,
                                      width: width,
                                      alignment: Alignment.topLeft,
                                      color: whiteLight,
                                      padding: EdgeInsets.all(5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Place: " +
                                                _controllerForEvent
                                                    .eventDetails.value.place,
                                            style: subtitle2,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 6,
                                          ),
                                          Spacing.verticalSpacing(5),
                                          Text(
                                            "Team Size: " +
                                                _controllerForEvent
                                                    .eventDetails.value.size,
                                            style: subtitle2,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 6,
                                          ),
                                          Spacing.verticalSpacing(5),
                                          Text(
                                            "Sports Category: " +
                                                _controllerForEvent.eventDetails
                                                    .value.category,
                                            style: subtitle2,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 6,
                                          ),
                                          Spacing.verticalSpacing(5),
                                          Text(
                                            "Event Starting at: " +
                                                _controllerForEvent
                                                    .eventDetails.value.date,
                                            style: subtitle2,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 6,
                                          ),
                                          Spacing.verticalSpacing(5),
                                          Text(
                                            "Active: " +
                                                _controllerForEvent
                                                    .eventDetails.value.active
                                                    .toString(),
                                            style: subtitle2,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 6,
                                          ),
                                        ],
                                      ),
                                    ),
                                    maintainState: true,
                                    visible:
                                        _controllerForTab.selectedIndex.value ==
                                            1,
                                  ),
                                ],
                                index: _controllerForTab.selectedIndex.value,
                              ),
                            )),
                        SizedBox(
                          width: width - 100,
                          child: ElevatedButton(
                            onPressed: () => Get.toNamed('/join/' + id),
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
                          "Oops ... No Data found",
                          style: headline5.copyWith(color: Colors.white),
                        )
                      ],
                    ),
                  ),
      ),
    );
  }
}
