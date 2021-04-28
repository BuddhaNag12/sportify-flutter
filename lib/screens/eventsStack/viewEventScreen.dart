import 'package:flutter/material.dart';
import 'package:sportify/global_widgets/appbar.dart';
import 'package:sportify/widgets/localWidgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class ViewEventScreen extends StatefulWidget {
  @override
  _ViewEventScreenState createState() => _ViewEventScreenState();
}

class _ViewEventScreenState extends State<ViewEventScreen>
    with TickerProviderStateMixin {
  final Completer<GoogleMapController> _controller = Completer();
  Marker marker;
  BitmapDescriptor pinLocationIcon;
  TabController tabController;
  int selectedIndex = 0;

  LatLng latlng = LatLng(24.805426, 93.103355);

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(24.805426, 93.103355),
    zoom: 11,
  );

  @override
  void initState() {
    super.initState();
    initializeTabController();
  }

  void initializeTabController() {
    tabController = TabController(
      initialIndex: selectedIndex,
      length: 2,
      vsync: this,
    );
  }

  void addMarker() {
    marker = Marker(
      markerId: MarkerId("home"),
      position: latlng,
      draggable: false,
      zIndex: 2,
      flat: true,
      anchor: Offset(0.5, 0.5),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

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
                child: ClipOval(
                  child: GoogleMap(
                    mapType: MapType.hybrid,
                    initialCameraPosition: _kGooglePlex,
                    markers: Set.of((marker != null) ? [marker] : []),
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                      this.setState(() {
                        addMarker();
                      });
                    },
                  ),
                ),
              ),
            ),
            spacer(5),
            headerCard(width, context),
            Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: TabBar(
                controller: tabController,
                tabs: [
                  Tab(
                    child: Text("Details".toUpperCase()),
                  ),
                  Tab(child: Text("More info".toUpperCase())),
                ],
                onTap: (int index) {
                  setState(() {
                    selectedIndex = index;
                    tabController.animateTo(index);
                  });
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5.0),
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: IndexedStack(
                children: <Widget>[
                  Visibility(
                    child: Container(
                      height: 120,
                      child: Text(
                        'about the tournament it is open tournament for any participants to join it and play the tournament,lorem ipsm i slorem ipsm islorem ipsm islorem ipsm is lorem ipsm is',
                        style: Theme.of(context).textTheme.headline6,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 6,
                      ),
                    ),
                    maintainState: true,
                    visible: selectedIndex == 0,
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
                    visible: selectedIndex == 1,
                  ),
                ],
                index: selectedIndex,
              ),
            ),
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
