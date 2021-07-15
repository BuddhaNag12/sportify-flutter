import '../exports/viewEvtexport.dart';

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
                        child:
                            ClipOval(child: GetBuilder<EventDetailsController>(
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
                                  width: width,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Place:" +
                                            _controllerForEvent
                                                .eventDetails.value.place,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1
                                            .copyWith(color: Colors.black),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 6,
                                      ),
                                      Text(
                                        "Team Size: " +
                                            _controllerForEvent
                                                .eventDetails.value.size,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1
                                            .copyWith(color: Colors.black),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 6,
                                      ),
                                      Text(
                                        "Sports Category:" +
                                            _controllerForEvent
                                                .eventDetails.value.category,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1
                                            .copyWith(color: Colors.black),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 6,
                                      ),
                                      Text(
                                        "Event Starting at:" +
                                            _controllerForEvent
                                                .eventDetails.value.date,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1
                                            .copyWith(color: Colors.black),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 6,
                                      ),
                                      Text(
                                        "Active:" +
                                            _controllerForEvent
                                                .eventDetails.value.active
                                                .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1
                                            .copyWith(color: Colors.black),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 6,
                                      ),
                                    ],
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
